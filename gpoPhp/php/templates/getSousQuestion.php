<?php

    require "../model/scripts.php";

    $idQuestion = $_GET["idQuestion"];

    $reponse = [];

    if (isset($idQuestion) && $idQuestion != ""){
        $reponse = getQuestion($idQuestion);
        if ($reponse){
            $donnee = new stdClass();
            foreach ($reponse as $uneReponse){
                $donnee = $uneReponse;
            }
            $donnee["questionLiee"] = explode("Q",$donnee["questionLiee"]);
            if ($donnee["questionLiee"][0] === ""){
                $compteur = 0;
                foreach ($donnee["questionLiee"] as $uneQuestionLiee){
                    $donnee["questionLiee"][$compteur] = $uneQuestionLiee;
                }
                unset($donnee["questionLiee"][1]);
            }
            echo json_encode($donnee);

        }
    }else{

    }