<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Security\Core\Validator\Constraints\UserPassword;
use Symfony\Component\Validator\Constraints\Email;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotNull;

class UserEditType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class, [
                'required'=>true,
                'mapped'=>true,
                'property_path'=>"email",
                'constraints'=>[
                    new Email(['message'=>'Invalide email adress.']),
                ]
            ])
            ->add('username', TextType::class, [
                'required'=>true,
                'mapped'=>true,
                'property_path'=>"username",
            ])
            ->add('plainPassword', RepeatedType::class, [
                'mapped' => false,
                'type' => PasswordType::class,
                'invalid_message' => 'The password fields must match.',
                'options' => ['attr' => ['class' => 'password-field']],
                'required' => false,
                'first_options'  => [
                    'label' => 'New password',
                    'constraints'=>[
                        new Length( null, 7, null, null, null, null, "Password should contain 7 caracters at least"),
                    ]
                ],
                'second_options' => [
                    'label' => 'Confirm new password',
                    'attr' => [
                        'style' => 'margin-bottom: 20px;'
                    ]
                    ],
            ])
            ->add('password', PasswordType::class,[
                'mapped'=>false,
                'constraints'=> [
                    new UserPassword(['message'=>"Incorrect user password, try again !"]),
                    new NotNull(['message'=>"Enter your current password to save changes."])
                ],
                'attr'=>[
                    'value'=>''
                ]
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
            'csrf_protection'=>true,

        ]);
    }
}
