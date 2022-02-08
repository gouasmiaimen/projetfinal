<?php

namespace App\Controller;

use App\Repository\SessionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ApiSessionController extends AbstractController
{
    /**
     * @Route("/api/session", name="api_session")
     */
    public function index(SessionRepository $sessionRepository): Response
    {
        $listeSessions= $sessionRepository->findAll();
       return $this->render('api_session/index.html.twig', [
            'controller_name' => 'ApiSessionController',
            'listeSessions' => $listeSessions
        ]); 
     // return new Response(json_encode($listeSessions),200,array('content-type'=>'application/json'));
    }
}
