<?php

require ("../model/scripts.php");

$idQuestion = $_GET["idQuestion"];

$resultat = [];

if (isset($idQuestion) && $idQuestion != "") {
    $resultat = getChoixQuestion($idQuestion);
    if ($resultat){
        $donnees = new stdClass();
        $compteur = 0;
        foreach ($resultat as $unChoix){
            $donnees->Ordre_Choix[$compteur] = $unChoix["Ordre_Choix"];
            $donnees->Libel_Choix[$compteur] = $unChoix["Libel_Choix"];
            $donnees->ID_Question = $unChoix["ID_Question"];
            $compteur++;
        }
        echo json_encode($donnees);
    }
}else{

}
