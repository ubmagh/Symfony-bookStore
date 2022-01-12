<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/cp")
 */
class CpController extends AbstractController
{

    /**
     * @Route("/", name="cp_index")
     */
    public function cp(): Response
    {
        $this->denyAccessUnlessGranted("ROLE_ADMIN");
        return $this->render('cp/index.html.twig');
    }
}
