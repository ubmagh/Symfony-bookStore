<?php

namespace App\Controller;

use App\Entity\Auteur;
use App\Form\AuteurType;
use App\Repository\AuteurRepository;
use App\Repository\LivreRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Query\Expr;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Console\Output\ConsoleOutput;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Intl\Countries;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/authors")
 */
class AuteurController extends AbstractController
{
    /**
     * @Route("/api", name="auteur_api", methods={"GET"})
     */
    public function apiSuggestions(AuteurRepository $auteurRepository, Request $request) : Response {
        if( $this->getUser()==null )
            return $this->json([]);
        $value = trim($request->get('value'));
        if( strlen($value)>0 )
            $authors = $auteurRepository->createQueryBuilder('a')->where('a.nom_prenom LIKE :value')->setParameter('value', "%".$request->get('value')."%")->getQuery()->getResult() ;
        else
            $authors = [];
        $cut = function( Auteur $author){
            return ['nom_prenom'=>$author->getNomPrenom(), 'value'=> intval( $author->getId()), "image"=> $author->getImage()  ];
        };
        $authors = array_map( $cut, $authors );
        return $this->json($authors);
    }

    /**
     * @Route("/", name="auteur_index", methods={"GET"})
     */
    public function index(AuteurRepository $auteurRepository, Request $request, PaginatorInterface $paginator): Response
    {
        $search = trim ( $request->get('search') );
        $nationalityCode = trim ( $request->get('nationalityCode') );
        $nationalityCode = $nationalityCode=="-"? "":$nationalityCode;
        $submitted = trim ( $request->get('submitted') );

        $query = $auteurRepository->fastSearch( strlen($search)>0? $search:null, strlen($nationalityCode)>0? $nationalityCode:null );

        $authors = $paginator->paginate(
            $query,
            $request->query->getInt('page', 1), /*page number*/
            16 /*limit per page*/
        );

        $countries = Countries::getCountryCodes();

        return $this->render('auteur/userNavigation.html.twig', [
            'auteurs' => $auteurRepository->findAll(),
            'search' => $search,
            'nationalityCode' => $nationalityCode,
            'submitted' => $submitted,
            'authors' => $authors,
            'countries' => $countries,
            'order'=> $request->get('order'),
            'totalCount' => $authors->getTotalItemCount()
        ]);
    }

    /**
     * @Route("/new", name="auteur_new", methods={"GET", "POST"})
     */
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $auteur = new Auteur();
        $form = $this->createForm(AuteurType::class, $auteur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($auteur);
            $entityManager->flush();
            $this->addFlash('created', 'true');
            return $this->redirectToRoute('auteur_show', ['id'=>$auteur->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('auteur/new.html.twig', [
            'auteur' => $auteur,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="auteur_show", methods={"GET"})
     */
    public function show( Auteur $auteur, Request $request, PaginatorInterface $paginator, LivreRepository $livreRepository): Response
    {
        $this->denyAccessUnlessGranted("IS_AUTHENTICATED_FULLY");
        $books = $paginator->paginate(
            $livreRepository->createQueryBuilder('l')
                ->leftJoin('l.auteurs', 'a')
                ->where("a.id = :id")
                ->setParameter('id', $auteur->getId())->getQuery(),
            $request->query->getInt('page', 1), /*page number*/
            20 /*limit per page*/
        );
        return $this->render('auteur/show.html.twig', [
            'auteur' => $auteur,
            'books' => $books,
            'page' => $request->query->getInt('page', 1),
            'order' => $request->get('order')
        ]);
    }

    /**
     * @Route("/{id}/edit", name="auteur_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Auteur $auteur, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(AuteurType::class, $auteur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();
            $this->addFlash('editted', 'true');
            return $this->redirectToRoute('auteur_show', ['id'=>$auteur->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('auteur/edit.html.twig', [
            'auteur' => $auteur,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="auteur_delete", methods={"POST"})
     */
    public function delete(Request $request, Auteur $auteur, EntityManagerInterface $entityManager, LivreRepository $livreRepository, AuteurRepository $auteurRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$auteur->getId(), $request->request->get('_token'))) {
            $entityManager->remove($auteur);
            $this->addFlash('deleted', $auteur->getNomPrenom());
            $entityManager->flush();
            // delete books with no authors
            $booksWithAuthors = $livreRepository->createQueryBuilder('l')->select('l.id')->join('l.auteurs', 'a', Expr\Join::WITH, null)->distinct(true)->getQuery()->getScalarResult();
            for( $i=0; $i<count($booksWithAuthors); $i++)
                $booksWithAuthors[$i]= intval($booksWithAuthors[$i]['id']);
            dump( $booksWithAuthors);
            $booksWithNoWauthors = $livreRepository->createQueryBuilder('l')->select('l.id')->where(" l.id NOT IN (:arraOy) ")->setParameter("arraOy", $booksWithAuthors)->getQuery()->getResult();
            dump( $booksWithNoWauthors);
            foreach ( $booksWithNoWauthors as $book)
                $entityManager->remove( $livreRepository->find($book) );
            $entityManager->flush();
        }

        return $this->redirectToRoute('cp_auteur_index', [], Response::HTTP_SEE_OTHER);
    }
}
