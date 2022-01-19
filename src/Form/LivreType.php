<?php

namespace App\Form;

use App\Entity\Livre;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\BirthdayType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\RangeType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\UrlType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class LivreType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('titre', TextType::class, [
                'label'=> "Full name",
                'attr'=>[
                    'maxlength'=>'150'
                ]
            ])
            ->add('isbn', TextType::class, [
                'label'=> "ISBN-13 reference",
                'attr'=>[
                    'maxlength'=>'17'
                ]
            ])
            ->add('nombre_pages', IntegerType::class,[
                'label' => "Number of pages",
                'attr'=>[
                    'maxlength'=>'17'
                ]
            ])
            ->add('date_de_parution', BirthdayType::class, [
                'label' => "Publishing date",
                'widget' => 'single_text',
                'years' => [500]
            ])
            ->add('note', RangeType::class,[
                'label' => "Rating (of 20)",
                'attr' => [
                    'min' => 0,
                    'max' => 20,
                    "style" => "width: 100%;"
                ],
            ])
            ->add('image', UrlType::class,[
                'label' => "Image",
                'invalid_message'=>"Invalid image url ",
                'attr'=>[
                    'class'=>'ui search dropdown'
                ]
            ])
            ->add('auteurs') // manually created
            ->add('genres') // manually created
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Livre::class,
        ]);
    }
}
