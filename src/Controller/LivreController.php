<?php

namespace App\Controller;

use App\Entity\Livre;
use App\Form\LivreType;
use App\Repository\AuteurRepository;
use App\Repository\GenreRepository;
use App\Repository\LivreRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query\Expr;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class LivreController extends AbstractController
{
    /**
     * @Route("/books", name="livre_index", methods={"GET"})
     */
    public function index(LivreRepository $livreRepository, GenreRepository $genreRepository, AuteurRepository $auteurRepository, Request $request, PaginatorInterface $paginator): Response
    {
        $this->denyAccessUnlessGranted("IS_AUTHENTICATED_FULLY");
        $search = trim($request->get('search'));
        $edate = trim($request->get('edate'));
        $sdate = trim($request->get('sdate'));

        $authors = $request->get('authorsIds');
        $genresIds = $request->get('genresIds');
        $genresObject = json_decode($genresIds);
        $authorsObject = json_decode( $authors );
        $genres = $genreRepository->createQueryBuilder('g')->select(['g.id', 'g.nom'])->addSelect("COUNT(l.id) as livresnbr ")->leftJoin('g.livres', 'l', Expr\Join::WITH, null)->groupBy('g.id')->orderBy('livresnbr', 'desc')->setMaxResults(14)->getQuery()->getResult();
        $submitted = strlen($request->get('submitted'))>0;
        $submitted &= strlen($search.$edate.$sdate)>0 && count($genresObject)>0 && count($authorsObject)>0;


        if( !$this->dateIsValid($sdate) )
            $sdate = null;
        if( !$this->dateIsValid($edate) )
            $edate = null;

        if( is_array($genresObject) )
            for( $i=0; $i<count($genresObject); $i++)
                $genresObject[$i] = intval($genresObject[$i]);
        else
            $genresObject = [];

        $authorsIDS = [];
        if( is_array($authorsObject) )
            for( $i=0; $i<count($authorsObject); $i++)
                $authorsIDS[] = intval($authorsObject[$i]);
        if( $submitted )
            $booksQuery = $livreRepository->deepSearch( $search, $sdate, $edate, $genresObject, $authorsIDS) ;
        else
            $booksQuery =$livreRepository->findAllQuery();

        $authorsAsTags  = [];
        foreach( $authorsIDS as $id){
            $author = $auteurRepository->find($id);
            $authorsAsTags [] = (Object) [ "value"=>$author->getId()."", 'nom_prenom' =>$author->getNomPrenom(), 'image'=>$author->getImage() ];
        }

        $books = $paginator->paginate(
            $booksQuery,
            $request->query->getInt('page', 1), /*page number*/
            10 /*limit per page*/
        );

        return $this->render('livre/usernavigation.html.twig', [
            'books' => $books,
            'genres' => $genres,
            'search' => $search,
            'submitted' => $submitted ,
            'genresIds' => $genresObject,
            'authors'=> $authorsAsTags,
            'authorsIds'=> $authorsIDS,
            'edate' => $edate,
            'sdate' => $sdate,
            'order'=> $request->get('order')
        ]);
    }



    private function dateIsValid($date, $format = 'Y-m-d')
    {
        $d =  \DateTime::createFromFormat($format, $date);
        return $d && $d->format($format) === $date;
    }

    /**
     * @Route("/cp/books/new", name="livre_new", methods={"GET", "POST"})
     */
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $livre = new Livre();
        $form = $this->createForm(LivreType::class, $livre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($livre);
            $entityManager->flush();

            return $this->redirectToRoute('cp_livre_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('livre/new.html.twig', [
            'livre' => $livre,
            'form' => $form,

        ]);
    }

    /**
     * @Route("/books/{id}", name="livre_show", methods={"GET"})
     */
    public function show(Livre $livre): Response
    {
        $this->denyAccessUnlessGranted("IS_AUTHENTICATED_FULLY");
        return $this->render('livre/show.html.twig', [
            'book' => $livre,
        ]);
    }

    /**
     * @Route("/cp/books/{id}/edit", name="livre_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Livre $livre, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(LivreType::class, $livre);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('editted', 'true');
            return $this->redirectToRoute('cp_livre_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('livre/edit.html.twig', [
            'book' => $livre,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/cp/books/{id}", name="livre_delete", methods={"POST"})
     */
    public function delete(Request $request, Livre $livre, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$livre->getId(), $request->request->get('_token'))) {
            $entityManager->remove($livre);
            $entityManager->flush();
            $this->addFlash('deleted', $livre->getTitre());
        }

        return $this->redirectToRoute('cp_livre_index', [], Response::HTTP_SEE_OTHER);
    }
}
