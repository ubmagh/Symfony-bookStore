<?php

namespace App\Controller;

use App\Repository\AuteurRepository;
use App\Repository\GenreRepository;
use App\Repository\LivreRepository;
use App\Repository\UserRepository;
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
    public function index(): Response
    {
        $this->denyAccessUnlessGranted("ROLE_ADMIN");
        return $this->render('cp/index.html.twig');
    }

    /**
     * @Route("/books", name="cp_livre_index", methods={"GET"})
     */
    public function booksIndex( Request $request, LivreRepository $livreRepository, PaginatorInterface $paginator): Response
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

    /**
     * @Route("/authors", name="cp_auteur_index", methods={"GET"})
     */
    public function authorsIndex(Request $request, AuteurRepository $auteurRepository, PaginatorInterface $paginator): Response
    {
        $search = trim(  $request->get('search','') ) ;
        $page = $request->query->getInt('page', 1);
        if( strlen( $search )>0 ){
            $query = $auteurRepository->searchAuthorsLiteQuery($search);
            $authors = $paginator->paginate(
                $query,
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        } else{
            $authors = $paginator->paginate(
                $auteurRepository->findAllQuery(),
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        }
        return $this->render('auteur/index.html.twig', [
            'authors' => $authors,
            'search' => $search,
            'order'=> $request->get('order'),
            'currentPage'=> $page
        ]);
    }

    /**
     * @Route("/genres", name="cp_genre_index", methods={"GET"})
     */
    public function genresIndex(Request $request, GenreRepository $genreRepository, PaginatorInterface $paginator): Response
    {
        $search = trim(  $request->get('search','') ) ;
        $page = $request->query->getInt('page', 1);
        if( strlen( $search )>0 ){
            $query = $genreRepository->searchGenresLiteQuery($search);
            $genres = $paginator->paginate(
                $query,
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        } else{
            $genres = $paginator->paginate(
                $genreRepository->findAllQuery(),
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        }
        return $this->render('genre/index.html.twig', [
            'genres' => $genres,
            'search' => $search,
            'order'=> $request->get('order'),
            'currentPage'=> $page
        ]);
    }

    /**
     * @Route("/users", name="cp_user_index", methods={"GET"})
     */
    public function usersIndex(Request $request, UserRepository $userRepository, PaginatorInterface $paginator): Response
    {
        $search = trim(  $request->get('search','') ) ;
        $page = $request->query->getInt('page', 1);
        if( strlen( $search )>0 ){
            $query = $userRepository->searchUsersLiteQuery($search);
            $users = $paginator->paginate(
                $query,
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        } else{
            $users = $paginator->paginate(
                $userRepository->findAllQuery(),
                $request->query->getInt('page', 1), /*page number*/
                25 /*limit per page*/
            );
        }
        return $this->render('user/index.html.twig', [
            'users' => $users,
            'search' => $search,
            'order'=> $request->get('order'),
            'currentPage'=> $page
        ]);
    }

}
