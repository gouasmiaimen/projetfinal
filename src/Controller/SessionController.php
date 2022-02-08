<?php

namespace App\Controller;

use App\Entity\Session;
use App\Entity\User;
use App\Form\SessionType;
use App\Repository\SessionRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/session")
 */
class SessionController extends AbstractController
{
    /**
     * @Route("/", name="session_index", methods={"GET"})
     */
    public function index(SessionRepository $sessionRepository): Response
    {
        return $this->render('session/index.html.twig', [
            'sessions' => $sessionRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="session_new", methods={"GET", "POST"})
     */
    public function new(Request $request, EntityManagerInterface $entityManager, UserRepository $userRepository): Response
    {
        $session = new Session();
        $session->setPhoto('');
        $form = $this->createForm(SessionType::class, $session);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $newImg= new File($session->getPhoto());
            $nomImg= md5(uniqid()).'.'.$newImg->guessExtension();
            $newImg->move("assets/uploads/sessions/", $nomImg);
            $session->setPhoto($nomImg);

            $entityManager->persist($session);
            $entityManager->flush();

            return $this->redirectToRoute('session_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('session/new.html.twig', [
            'session' => $session,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="session_show", methods={"GET"})
     */
    public function show(Session $session): Response
    {
        return $this->render('session/show.html.twig', [
            'session' => $session,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="session_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Session $session, EntityManagerInterface $entityManager): Response
    {
        $session->setPhoto('');
        $form = $this->createForm(SessionType::class, $session);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $newImg= new File($session->getPhoto());
            $nomImg= md5(uniqid()).'.'.$newImg->guessExtension();
            $newImg->move("assets/uploads/sessions/", $nomImg);
            $session->setPhoto($nomImg);

            $entityManager->flush();

            return $this->redirectToRoute('session_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('session/edit.html.twig', [
            'session' => $session,
            'form' => $form,
        ]);
    }
        /**
     * @Route("/{id}/userlist", name="session_list", methods={"GET", "POST"})
     */
    public function userList(Request $request,UserRepository $userRepository, Session $session, EntityManagerInterface $entityManager): Response
    {
        
        $listeUsers=$session->getUsers();
        $usersDb= $userRepository->findByRole('ROLE_USER');

        //ajout utilisateur à une session de formation
        $userSession=$request->get('userSession');
        //var_dump($userSession);
        if ($userSession != null) {
            $tempUser=$userRepository->find((int)$userSession);
           // dump($tempUser);
            $session->addUser($tempUser);
            $entityManager->flush();

        }
        
        return $this->renderForm('session/userList.html.twig', [
            'session' => $session,
            'userDb' => $usersDb,
            'users' => $listeUsers
        ]);
    }

    /**
     * @Route("/{id}", name="session_delete", methods={"POST"})
     */
    public function delete(Request $request, Session $session, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$session->getId(), $request->request->get('_token'))) {
            $entityManager->remove($session);
            $entityManager->flush();
        }

        return $this->redirectToRoute('session_index', [], Response::HTTP_SEE_OTHER);
    }
}
