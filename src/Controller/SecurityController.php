<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\AccountDetailsType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\FormError;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    /**
     * @Route("/login", name="app_login")
     */
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
         if ($this->getUser()) {
             return $this->redirectToRoute('home');
         }

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }


    /**
     * @Route("/account", name="app_account")
     */
    public function accountDetails( UserRepository $userRepository, Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager):Response{
        $this->denyAccessUnlessGranted("IS_AUTHENTICATED_FULLY");
        $status = null;

        $user = $userRepository->loadUserByIdentifier( $this->getUser()->getUserIdentifier() )   ;


        $form = $this->createForm(AccountDetailsType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {


            $user->setUsername( $form->get('username')->getData() )-> setEmail( $form->get('email')->getData() );
            if( strlen( $form->get('plainPassword')->getData() ) >0 )
                $userRepository->upgradePassword(
                    $user,
                    $userPasswordHasher->hashPassword(
                        $user,
                        $form->get('plainPassword')->getData()
                    )
                );
            else{
                $entityManager->persist($user);
                $entityManager->flush();
            }
            $status = "updated";
        }else{
            $entityManager->refresh($user);
        }
        return $this->render('security/account.html.twig', [ 'status'=>$status, 'accountForm'=>$form->createView()]);
    }


    /**
     * @Route("/logout", name="app_logout")
     */
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }
}
