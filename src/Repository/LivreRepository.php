<?php

namespace App\Repository;

use App\Entity\Livre;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Livre|null find($id, $lockMode = null, $lockVersion = null)
 * @method Livre|null findOneBy(array $criteria, array $orderBy = null)
 * @method Livre[]    findAll()
 * @method Livre[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class LivreRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Livre::class);
    }

    public function searchBooksLite($keyword, $sdate, $edate) : Query
    {
        $Query = "
            SELECT l, a
            FROM App\Entity\Livre l
            INNER JOIN l.auteurs a ";
        $parentheseOpen = false;
        $isbnWithoutDashes = str_replace( '-', '', $keyword);
        if( $sdate != NULL ) {
            $Query .= "WHERE l.date_de_parution>=:sdate ";
            if( $edate != NULL )
                $Query .= "AND l.date_de_parution<=:edate ";
            $Query.= "AND ( ";
            $parentheseOpen = !0;
        }elseif ($edate != NULL){
            $Query .= "WHERE l.date_de_parution<=:edate ";
            $Query.= "AND ( ";
            $parentheseOpen = !0;
        }else
            $Query .= "WHERE ";
        $Query .= "
             l.titre LIKE :keyword
             OR l.isbn LIKE :keyword
             OR l.isbn LIKE :isbn
            OR l.isbn LIKE :keyword
            OR a.nom_prenom LIKE :keyword
            ";
        if( $parentheseOpen )
            $Query .= " ) ";
        $query = $this->getEntityManager()->createQuery($Query)->setParameter('keyword', "%".$keyword."%")->setParameter("isbn", "%".$isbnWithoutDashes."%");
        if( $sdate!=NULL)
            $query->setParameter('sdate', $sdate);
        if( $edate!=NULL)
            $query->setParameter( 'edate', $edate);
         return $query;
    }

    public function findAllQuery( ) :Query {
        return $this->getEntityManager()->createQuery("SELECT l FROM App\Entity\Livre l");
    }

    public function countAll():int{
        $queryString = "
            SELECT count(l.id) as num
            FROM App\Entity\Livre l
        ";
        $query = $this->getEntityManager()->createQuery($queryString);
        return (int) $query->getSingleScalarResult();
    }


    public function deepSearch( $search, $sdate, $edate, $genresids, $authorsids) : Query{

        $Query = "
            SELECT l
            FROM App\Entity\Livre l";
        $where = false;

        if( count( $authorsids )>0 ){
            $authorsImploded = implode( ",", $authorsids);
            $Query .= " LEFT JOIN l.auteurs a  ";
        }

        if( count($genresids)>0 ){
            $gernesImploded = implode( ",", $genresids);
            $Query .= " LEFT JOIN l.genres g  ";
        }

        if( count( $authorsids )>0 ){
            $where = !0;
            $Query .= " WHERE a.id in (".$authorsImploded." ) ";
            if( count($genresids)>0 )
                $Query .= " AND g.id in ( ".$gernesImploded." ) ";
        }else{
            if( count($genresids)>0 ){
                $Query .= " WHERE g.id in ( ".$gernesImploded." ) ";
                $where = !0;
            }
        }

        $isbnWithoutDashes = str_replace( '-', '', $search);
        if( $sdate != NULL ) {
            $Query .= "WHERE l.date_de_parution>=:sdate ";
            $where =!0;
            if( $edate != NULL ){
                $Query .= "AND l.date_de_parution<=:edate ";
            }
        }elseif ($edate != NULL){
            $Query .= "WHERE l.date_de_parution<=:edate ";
            $where = !0;
        }

        if( strlen($search )>0) {
            if( !$where ) {
                $where = !0;
                $Query .= " WHERE ( ";
            }else{
                $Query .= " AND ( ";
            }
            $Query .= " 
                 l.titre LIKE :keyword
                 OR l.isbn LIKE :keyword
                 OR l.isbn LIKE :isbn
                OR l.isbn LIKE :keyword
                )
                ";

        }

        $query = $this->getEntityManager()->createQuery($Query);
        if( strlen($search)>0 )
            $query->setParameter('keyword', "%".$search."%")->setParameter("isbn", "%".$isbnWithoutDashes."%");

        if( $sdate!=NULL)
            $query->setParameter('sdate', $sdate);
        if( $edate!=NULL)
            $query->setParameter( 'edate', $edate);

        return $query;
    }

    // /**
    //  * @return Livre[] Returns an array of Livre objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('l.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Livre
    {
        return $this->createQueryBuilder('l')
            ->andWhere('l.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
