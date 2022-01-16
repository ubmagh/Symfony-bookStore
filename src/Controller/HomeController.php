<?php

namespace App\Controller;

use App\Entity\Auteur;
use App\Entity\Livre;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index( Request $request, PaginatorInterface $paginator, ManagerRegistry $doctrine): Response
    {
        $search = trim( $request->get('search') );
        $sdate = trim($request->get('sdate'));
        $edate = trim($request->get('edate'));

        $livres = null;
        $submitted = false;
        $nbrBooks = 0;
        $nbrAuthors = 0;

        if( strlen($search)>0 || strlen($sdate)>0 || strlen($edate)>0 ){
            $submitted = true;
            $LivreRepo = $doctrine->getRepository( Livre::class );
            if( !$this->validateDate($sdate) )
                $sdate = NULL;
            if( !$this->validateDate($edate) )
                $edate = NULL;

            $query = $LivreRepo->searchBooksLite($search, $sdate, $edate);
            $livres = $paginator->paginate(
                $query,
                $request->query->getInt('page', 1), /*page number*/
                12 /*limit per page*/
            );
            $totalCount = $livres->getTotalItemCount();
        }else{
            $LivreRepo = $doctrine->getRepository( Livre::class );
            $AuteurRepo = $doctrine->getRepository( Auteur::class );

            $nbrBooks = $LivreRepo->countAll();
            $nbrAuthors = $AuteurRepo->countAll();
            $totalCount=0;
        }

        return $this->render('home/index.html.twig', [
            'books' => $livres,
            'totalCount' => $totalCount,
            'search' => $search,
            'sdate' => $sdate,
            'edate' => $edate,
            'submitted' => $submitted,
            'nbrBooks' => $nbrBooks,
            'nbrAuthors' => $nbrAuthors,
            'order'=> $request->get('order')
        ]);
    }

    private function validateDate($date, $format = 'Y-m-d')
    {
        $d =  \DateTime::createFromFormat($format, $date);
        return $d && $d->format($format) === $date;
    }

}
