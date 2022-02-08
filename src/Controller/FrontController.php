<?php

namespace App\Controller;

use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
* @Route("/front")
*/
class FrontController extends AbstractController
{
    /**
     * @Route("/", name="front_users")
     */
    public function index(UserRepository $userRepository): Response
    {
        $users=$userRepository->findAll();

        return $this->render('front/index.html.twig', [
            'controller_name' => 'FrontController',
            'users' => $users
        ]);
    }
}
