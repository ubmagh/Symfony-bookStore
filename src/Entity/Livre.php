<?php

namespace App\Entity;

use App\Repository\LivreRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;



/**
 * @ORM\Entity(repositoryClass=LivreRepository::class)
 * @UniqueEntity(fields={"isbn"}, message="This ISBN13 key exists already")
 */
class Livre
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(name="isbn", type="string", length=17, unique=true)
     * @Assert\NotBlank(message="Enter the ISBN13 key")
     * @Assert\Regex(
     *     pattern="/^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$/",
     *     match=true,
     *     message="Invalid ISBN13 key"
     * )
     */
    private $isbn;

    /**
     * @ORM\Column(type="string", length=150)
     */
    private $titre;

    /**
     * @ORM\Column(type="integer")
     * @Assert\NotNull(message="Enter number of pages")
     * @Assert\Positive(message="Invalid number of pages")
     */
    private $nombre_pages;

    /**
     * @ORM\Column(type="date")*
     * @Assert\NotNull(message="Set publushing Date")
     * @Assert\NotBlank(message="Set publushing Date")
     * @Assert\Date(message="Invalid Date")
     * @Assert\LessThan("today", message="Invalid Date")
     */
    private $date_de_parution;

    /**
     * @ORM\Column(type="smallint")
     * @Assert\NotNull(message="Enter the mark")
     * @Assert\PositiveOrZero(message="Invalid Mark")
     * @Assert\Range(
     *      min = 0,
     *      max = 20,
     *      notInRangeMessage = "Invalid Mark, it should be between {{ min }} & {{ max }}.",
     * )
     */
    private $note;

    /**
     * @ORM\ManyToMany(targetEntity=Auteur::class, mappedBy="livres")
     * @Assert\Count(min=1, minMessage="A book must be written by one author at least")
     */
    private $auteurs;

    /**
     * @ORM\ManyToMany(targetEntity=Genre::class, inversedBy="livres")
     * @Assert\Count(min=1, minMessage="A book must belong to one genre at least")
     */
    private $genres;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

    public function __construct()
    {
        $this->auteurs = new ArrayCollection();
        $this->genres = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIsbn(): ?string
    {
        return $this->isbn;
    }

    public function setIsbn(string $isbn): self
    {
        $this->isbn = $isbn;

        return $this;
    }

    public function getTitre(): ?string
    {
        return $this->titre;
    }

    public function setTitre(string $titre): self
    {
        $this->titre = $titre;

        return $this;
    }

    public function getNombrePages(): ?string
    {
        return $this->nombre_pages;
    }

    public function setNombrePages(string $nombre_pages): self
    {
        $this->nombre_pages = $nombre_pages;

        return $this;
    }

    public function getDateDeParution(): ?\DateTimeInterface
    {
        return $this->date_de_parution;
    }

    public function setDateDeParution(\DateTimeInterface $date_de_parution): self
    {
        $this->date_de_parution = $date_de_parution;

        return $this;
    }

    public function getNote(): ?int
    {
        return $this->note;
    }

    public function setNote(int $note): self
    {
        $this->note = $note;

        return $this;
    }

    /**
     * @return Collection|Auteur[]
     */
    public function getAuteurs(): Collection
    {
        return $this->auteurs;
    }

    public function addAuteur(Auteur $auteur): self
    {
        if (!$this->auteurs->contains($auteur)) {
            $this->auteurs[] = $auteur;
            $auteur->addLivre($this);
        }

        return $this;
    }

    public function removeAuteur(Auteur $auteur): self
    {
        if ($this->auteurs->removeElement($auteur)) {
            $auteur->removeLivre($this);
        }

        return $this;
    }

    /**
     * @return Collection|Genre[]
     */
    public function getGenres(): Collection
    {
        return $this->genres;
    }

    public function addGenre(Genre $genre): self
    {
        if (!$this->genres->contains($genre)) {
            $this->genres[] = $genre;
        }

        return $this;
    }

    public function removeGenre(Genre $genre): self
    {
        $this->genres->removeElement($genre);

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }
}
