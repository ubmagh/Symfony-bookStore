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

        if( $sdate != NULL ) {
            $Query .= "WHERE l.date_de_parution>=:sdate ";
            if( $edate != NULL )
                $Query .= "AND l.date_de_parution<=:edate ";
            $Query.= "AND ";
        }elseif ($edate != NULL){
            $Query .= "WHERE l.date_de_parution<=:edate ";
            $Query.= "AND ";
        }else
            $Query .= "WHERE ";
        $Query .= "
             l.titre LIKE :keyword
            OR l.isbn LIKE :keyword
            OR a.nom_prenom LIKE :keyword
            ";

        return $this->getEntityManager()->createQuery($Query)->setParameter('keyword', "%".$keyword."%")->setParameter('sdate', $sdate)->setParameter( 'edate', $edate);
    }

    public function countAll():int{
        $queryString = "
            SELECT count(l.id) as num
            FROM App\Entity\Livre l
        ";

        $query = $this->getEntityManager()->createQuery($queryString);
        return (int) $query->getSingleScalarResult();
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
