<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FrontCategorieController extends AbstractController
{
    /**
     * @Route("/front/categorie", name="front_categorie")
     */
    public function index(): Response
    {
        return $this->render('front_categorie/index.html.twig', [
            'controller_name' => 'FrontCategorieController',
        ]);
    }
}
