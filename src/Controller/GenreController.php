<?php

namespace App\Controller;

use App\Entity\Auteur;
use App\Entity\Genre;
use App\Entity\Livre;
use App\Form\GenreType;
use App\Repository\AuteurRepository;
use App\Repository\GenreRepository;
use App\Repository\LivreRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query\Expr\Join;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class GenreController extends AbstractController
{

    /**
     * @Route("/api", name="genre_api", methods={"GET"})
     */
    public function apiSuggestions(GenreRepository $genreRepository, Request $request) : Response {
        if( $this->getUser()==null )
            return $this->json([]);
        $value = trim($request->get('value'));
        if( strlen($value)>0 )
            $genres = $genreRepository->createQueryBuilder('g')->where('g.nom LIKE :value')->setParameter('value', "%".$request->get('value')."%")->getQuery()->getResult() ;
        else
            $genres = [];
        $cut = function( Genre $genre){
            return ['nom'=>$genre->getNom(), 'value'=> intval( $genre->getId())  ];
        };
        $genres = array_map( $cut, $genres );
        return $this->json($genres);
    }

    /**
     * @Route("/genres", name="genre_index", methods={"GET"})
     */
    public function index(GenreRepository $genreRepository): Response
    {
        $this->denyAccessUnlessGranted("IS_AUTHENTICATED_FULLY");
        return $this->render('genre/memberIndex.html.twig', [
            'genres' => $genreRepository->findAll(),
        ]);
    }

    /**
     * @Route("/cp/genres/new", name="genre_new", methods={"GET", "POST"})
     */
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $genre = new Genre();
        $form = $this->createForm(GenreType::class, $genre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($genre);
            $entityManager->flush();
            $this->addFlash('created', 'true');
            return $this->redirectToRoute('genre_show', ['id'=>$genre->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('genre/new.html.twig', [
            'genre' => $genre,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/genres/{id}", name="genre_show", methods={"GET"})
     */
    public function show( Genre $genre, PaginatorInterface $paginator, LivreRepository $livreRepository, Request $request): Response
    {
        $this->denyAccessUnlessGranted("IS_AUTHENTICATED_FULLY");
        $books = $paginator->paginate(
            $livreRepository->createQueryBuilder('l')
                ->leftJoin('l.genres', 'g')
                ->where("g.id = :id")
                ->setParameter('id', $genre->getId())->getQuery(),
            $request->query->getInt('page', 1), /*page number*/
            20 /*limit per page*/
        );

        return $this->render('genre/show.html.twig', [
            'genre' => $genre,
            'books' => $books,
            'page' => $request->query->getInt('page', 1),
            'order' => $request->get('order')
        ]);
    }

    /**
     * @Route("/cp/genres/{id}/edit", name="genre_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Genre $genre, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(GenreType::class, $genre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('editted', 'true');
            return $this->redirectToRoute('genre_show', [ 'id'=>$genre->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('genre/edit.html.twig', [
            'genre' => $genre,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/cp/genres/{id}", name="genre_delete", methods={"POST"})
     */
    public function delete(Request $request, Genre $genre, EntityManagerInterface $entityManager): Response
    {
        if( $genre->getLivres()->count()>0 ){
            $referer = $request->headers->get('referer');
            return $this->redirect($referer);
        }
        if ($this->isCsrfTokenValid('delete'.$genre->getId(), $request->request->get('_token'))) {
            $entityManager->remove($genre);
            $this->addFlash('deleted', $genre->getNom());
            $entityManager->flush();
        }

        return $this->redirectToRoute('cp_genre_index', [ ], Response::HTTP_SEE_OTHER);
    }
}
