<?php

require "../model/scripts.php";

   $idQuestion = $_GET["idQuestion"];
   $idReponse = $_GET["idReponse"];
   $listeReponses = [];

   if (isset($idQuestion) && isset($idReponse)){
       $tab = getIdSousQuestionDeroulant($idQuestion,$idReponse);
       if ($tab){
           $listeReponses = getReponsesDeroulant($tab[0]["ID_Question"]);
           $donnee = new stdClass();
           $compteur = 1;
           foreach ($listeReponses as $uneReponse){
                $donnee->Libel_rep[$compteur] = $uneReponse["Libel_rep"];
               $donnee->ID_Reponse[$compteur] = $uneReponse["Id_Reponse"];
                $compteur++;
           }
           $donnee->ID_Question = $uneReponse["ID_Question"];
           echo json_encode($donnee);
       }else{
       }
   }
