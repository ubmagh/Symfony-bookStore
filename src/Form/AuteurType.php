<?php

namespace App\Form;

use App\Entity\Auteur;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\BirthdayType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AuteurType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom_prenom', TextType::class, [
                'label'=> "Full name",
                'attr'=>[
                    'maxlength'=>'100'
                ]
            ])
            ->add('sexe', ChoiceType::class, [
                'label' => "Sex",
                'choices' => [
                    'Male' => 'M',
                    'Female' => 'F'
                ],
               'expanded' => false, // check out  this link for possible combinations :
                'multiple'=>false,  //              https://symfony.com/doc/current/reference/forms/types/choice.html#select-tag-checkboxes-or-radio-buttons
                'attr' => ['class' => "ui radio checkbox"]
                ])
            ->add('date_de_naissance', BirthdayType::class, [ // https://symfony.com/doc/current/reference/forms/types/birthday.html
                'label' => "Birth date",
                'years' => [500],
                'widget' => 'single_text',
            ])
            ->add('nationalite', CountryType::class,[
                'label' => "Nationality",
                'attr'=>[
                    'class'=>'ui search dropdown'
                ]
            ])
            ->add('image', UrlType::class,[
                'label' => "Image",
                'invalid_message'=>"Invalid image url ",
                'attr'=>[
                    'class'=>'ui search dropdown'
                ]
            ])
            //->add('livres') // ;D
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Auteur::class,
        ]);
    }
}
