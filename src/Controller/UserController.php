<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserEditType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/cp/users")
 */
class UserController extends AbstractController
{

    /**
     * @Route("/new", name="user_new", methods={"GET", "POST"})
     */
    public function new(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository, UserPasswordHasherInterface $userPasswordHasher): Response
    {
        if( $this->getUser()->getUsername()!="admin" )
            throw new AccessDeniedHttpException();
        $user = new User();
        $form = $this->createForm(UserEditType::class, $user );
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $roles = $form->get("rolozos")->getData();
            if(strlen($roles)>0)
                $user->setRoles(['ROLE_ADMIN']);
            else
                $user->setRoles([]);
            $userRepository->upgradePassword(
                $user,
                $userPasswordHasher->hashPassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );
            $this->addFlash('created', 'true');
            return $this->redirectToRoute('user_show', [ "id"=>$user->getId()], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('user/new.html.twig', [
            'user' => $user,
            'form' => $form,
            'newUser'=> 1
        ]);
    }

    /**
     * @Route("/{id}", name="user_show", methods={"GET"})
     */
    public function show(User $user): Response
    {
        return $this->render('user/show.html.twig', [
            'user' => $user,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="user_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, User $user, EntityManagerInterface $entityManager, UserRepository $userRepository, UserPasswordHasherInterface $userPasswordHasher): Response
    {
        if( $this->getUser()->getUsername()!="admin" )
                throw new AccessDeniedHttpException();
        $oldUsername = $user->getUsername()."";

        $form = $this->createForm(UserEditType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user->setUsername($oldUsername);
            $roles = $form->get("rolozos")->getData();
            if(strlen($roles)>0)
                $user->setRoles(['ROLE_ADMIN']);
            else
                $user->setRoles([]);
            if( strlen( $form->get('plainPassword')->getData() ) >0 ) {
                $userRepository->upgradePassword(
                    $user,
                    $userPasswordHasher->hashPassword(
                        $user,
                        $form->get('plainPassword')->getData()
                    )
                );
            }else{
                $entityManager->persist($user);
                $entityManager->flush();
            }
            $this->addFlash('editted', 'true');
            return $this->redirectToRoute('user_show', [ 'id'=>$user->getId()], Response::HTTP_SEE_OTHER);
        }
        return $this->renderForm('user/edit.html.twig', [
            'user' => $user,
            'form' => $form,
            'newUser'=> 0
        ]);
    }

    /**
     * @Route("/{id}", name="user_delete", methods={"POST"})
     */
    public function delete(Request $request, User $user, EntityManagerInterface $entityManager): Response
    {
        if( $this->getUser()->getUsername()!="admin" )
            throw new AccessDeniedHttpException();

        if ($this->isCsrfTokenValid('delete'.$user->getId(), $request->request->get('_token'))) {
            $entityManager->remove($user);
            $entityManager->flush();
        }

        return $this->redirectToRoute('cp_user_index', [], Response::HTTP_SEE_OTHER);
    }
}
