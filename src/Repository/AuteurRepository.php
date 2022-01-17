<?php

namespace App\Repository;

use App\Entity\Auteur;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Auteur|null find($id, $lockMode = null, $lockVersion = null)
 * @method Auteur|null findOneBy(array $criteria, array $orderBy = null)
 * @method Auteur[]    findAll()
 * @method Auteur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AuteurRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Auteur::class);
    }

    public function countAll():int{
        $queryString = "
            SELECT count(a.id) as num
            FROM App\Entity\Auteur a
        ";

        $query = $this->getEntityManager()->createQuery($queryString);
        return (int) $query->getSingleScalarResult();
    }

    public function searchAuthorsLiteQuery($keyword) : Query
    {
        return $this->getEntityManager()->createQuery("
            SELECT a
            FROM App\Entity\Auteur a
            WHERE a.nom_prenom LIKE :keyword
            OR a.sexe LIKE :keyword
            OR a.date_de_naissance LIKE :keyword
            OR a.nationalite LIKE :keyword
            ")->setParameter('keyword', "%".$keyword."%");
    }

    public function findAllQuery( ) :Query {
        return $this->getEntityManager()->createQuery("SELECT a FROM App\Entity\Auteur a");
    }

    public function fastSearch( $search, $countryCode):Query {
        $query = $this->createQueryBuilder('a')->select("a")->addSelect(['a.id', 'a.nom_prenom', 'a.date_de_naissance', 'a.image', 'a.sexe', 'a.nationalite', 'COUNT(l.id) as nbrbooks'])
                    ->leftJoin('a.livres', 'l', Query\Expr\Join::WITH, null)
                    ->groupBy('a.id');
        if( $search!=null ) {
            $query->where('a.nom_prenom LIKE :keyword')->setParameter("keyword", "%" . $search . "%");
            if( $countryCode!=null )
                $query->andWhere(" a.nationalite LIKE :ccode")->setParameter("ccode", "%".$countryCode."%");
        }elseif ($countryCode!=null){
            $query->where(" a.nationalite LIKE :ccode")->setParameter("ccode", "%".$countryCode."%");
        }

        return $query->getQuery();
    }

    // /**
    //  * @return Auteur[] Returns an array of Auteur objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Auteur
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
