<?php

namespace App\DataFixtures;

use App\Entity\Auteur;
use App\Entity\Genre;
use App\Entity\Livre;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AppFixtures extends Fixture
{
    public function __construct(UserPasswordHasherInterface $hasher)
    {
        $this->hasher = $hasher;
        $this->nbrAuthors = 25;
        $this->nbrBooks = 60;
        $this->nbrGenres = 15;
    }

    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();
        $genres = [];
        $authors = [];
        $books =[];

        $adminUser = new User();
        $adminUser->setEmail("admin@localhost.io")->setUsername("admin");
        $password = $this->hasher->hashPassword( $adminUser, "password123");
        $adminUser->setPassword($password)->setRoles(["ROLE_ADMIN"]);
        $manager->persist($adminUser);
        $manager->flush();

        for( $i=0; $i<$this->nbrGenres; $i++){
            $genre = new Genre();
            $genre->setNom( "Genre ".($i+1) );
            $manager->persist($genre);
            $genres [] = $genre;
        }
        $manager->flush();


        for( $i=0; $i<$this->nbrAuthors; $i++){
            $author = new Auteur();
            $sexe = $faker->randomElement(['M','F']);
            $gender = $sexe == 'M' ? 'male':'female';
            $author->setNomPrenom( $faker->name($gender) )->setNationalite( $faker->country() )
                ->setDateDeNaissance( $faker->dateTimeBetween('-150 years', '-10 years') )
                ->setSexe( $sexe )->setImage( $faker->imageUrl(300, 600, 'portrait') );
            $manager->persist($author);
            $authors [] = $author;
        }
        $manager->flush();

        for( $i=0; $i<$this->nbrBooks; $i++){
            $book = new Livre();
            $isbn =  $faker->isbn13();
            $book->setTitre( $faker->sentence(6, true) )
                ->setImage( $faker->imageUrl(500,100, "book") )
                ->setDateDeParution( $faker->dateTimeBetween('1900-01-01', '2021-12-12') )
                ->setIsbn( $isbn )
                ->setNote( $faker->numberBetween(0,20) )
                ->setNombrePages( $faker->numberBetween( 60, 2845))
                ;
            $bookAuthors = $faker->randomElements( $authors, $faker->numberBetween(1,3) );
            foreach ( $bookAuthors as $aut )
                $book->addAuteur($aut);
            $bookGenres = $faker->randomElements( $genres, $faker->numberBetween(1,3) );
            foreach ( $bookGenres as $gen )
                $book->addGenre($gen);
            $manager->persist($book);
            $books [] = $book;
        }
        $manager->flush();


    }
}
