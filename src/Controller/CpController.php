<?php

namespace App\Controller;

use App\Repository\LivreRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/cp")
 */
class CpController extends AbstractController
{

    /**
     * @Route("/", name="cp_index")
     */
    public function cp(): Response
    {
        $this->denyAccessUnlessGranted("ROLE_ADMIN");
        return $this->render('cp/index.html.twig');
    }

    /**
     * @Route("/books", name="cp_livre_index", methods={"GET"})
     */
    public function index( Request $request, LivreRepository $livreRepository, PaginatorInterface $paginator): Response
    {
        $search = trim(  $request->get('search','') ) ;
        $page = $request->query->getInt('page', 1);
        if( strlen( $search )>0 ){
            $query = $livreRepository->searchBooksLite($search, NULL, NULL);
            $books = $paginator->paginate(
                $query,
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        } else{
            $books = $paginator->paginate(
                $livreRepository->findAllQuery(),
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        }
        return $this->render('livre/index.html.twig', [
            'books' => $books,
            'search' => $search,
            'order'=> $request->get('order'),
            'currentPage'=> $page
        ]);
    }

}
