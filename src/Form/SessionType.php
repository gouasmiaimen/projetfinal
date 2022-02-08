<?php

namespace App\Form;

use App\Entity\Categorie;
use App\Entity\Session;
use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SessionType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('label', null, [
                'attr'=>['class'=>'form-control']
            ])
            ->add('photo', FileType::class, [
                'attr'=>['class'=>'form-control']
            ])
            ->add('description', null,[
                'attr'=>['class'=>'form-control']
            ])
            ->add('prix', IntegerType::class, [
                'attr'=>['class'=>'form-control']
            ])
            ->add('dateDebut', DateType::class, [
                'attr'=>['class'=>'form-control']
            ])
            ->add('dateFin', DateType::class, [
                'attr'=>['class'=>'form-control']
            ])
            ->add('categorie', EntityType::class, [
                'class' => Categorie::class,
                'choice_label'=>'label',
                'attr'=>['class'=>'form-control']
            ])
            ->add('formateur', EntityType::class, [
                'class' => User::class,
                'choice_label'=>function(User $user){
                    return $user->getPrenom()." ".$user->getNom();
                },
                'attr'=>['class'=>'form-control'],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Session::class,
        ]);
    }
}
