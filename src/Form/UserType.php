<?php

namespace App\Form;

use App\Entity\Session;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class UserType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class,[
                'attr'=>['class'=>'form-control']
            ])
            ->add('roles', ChoiceType::class,[
                'attr'=>['class'=>'form-control'],
                'choices' =>[
                    'Apprenant' =>["yes"=>"ROLE_USER"],
                    'Formateur' =>["yes"=>"ROLE_FORM"],
                    'Administrateur' =>["yes"=>"ROLE_ADMIN"]
                ],
                'multiple'=> true
            ])
            ->add('password', PasswordType::class,[
                'attr'=>['class'=>'form-control']
            ])
            ->add('nom',null,[
                'attr'=>['class'=>'form-control']
            ])
            ->add('prenom',null,[
                'attr'=>['class'=>'form-control']
            ])
            ->add('photo', FileType::class,[
                'attr'=>['class'=>'form-control']
            ])
            ->add('dateCreation', DateType::class,[
                'attr'=>['class'=>'form-control']
            ])
          
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
