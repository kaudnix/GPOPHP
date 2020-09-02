<?php
//Variables SQL
$loginRequest = "SELECT *
                 FROM utilisateur
                 WHERE Identifiant = ':userId'
                 AND Password = ':userPassword'";

$sousDeroulantRequest = "SELECT DISTINCT Question.ID_Question, Question.questionLiee, 
                         SUBSTRING_INDEX(SUBSTRING_INDEX(question.questionLiee,'Q',-1),'R',1) AS idQuestionLiee,
						 SUBSTRING_INDEX(question.questionLiee,'R',-1) AS idReponseLiee
                         FROM Question, Reponse
                         WHERE Question.ID_Question = Reponse.ID_Question
                         AND Question.questionLiee NOT LIKE ''
                         HAVING idQuestionLiee = ':idQuestionLiee'
                         AND idReponseLiee = ':idReponseLiee'";

$sousQuestionRequest = "SELECT *,
                        SUBSTRING_INDEX(SUBSTRING_INDEX(question.questionLiee,'Q',-1),'R',1) AS idQuestionLiee
                        FROM Question
                        WHERE Question.questionLiee NOT LIKE '' 
                        HAVING idQuestionLiee = ':idQuestionLiee'";

$reponsesRequest = "SELECT Id_Reponse, Libel_rep, ID_Question
                    FROM Reponse
                    WHERE ID_Question = ':idQuestion'";


$choixquestionRequest = "SELECT *
                         FROM choix_question
                         WHERE ID_Question = ':idQuestion'
                         ORDER BY Ordre_Choix";

$questionRequest = "SELECT *
                    FROM Question
                    WHERE ID_Question = ':idQuestion'";

$groupesQuestionRequest = "SELECT TF.ID_Type, COUNT(DISTINCT A.numGroupe) as nbGroupes
                           FROM type_formulaire TF, avoir A, question Q
                           WHERE TF.ID_Type = A.ID_Type 
                           AND A.ID_Question = Q.ID_Question
                           AND TF.actif = ':idTypeForm'
                           GROUP BY TF.ID_Type;
                           ";

//fin variables SQL

// fonctions SQL
function login($id, $mdp){
    global $loginRequest;
    $requete = str_replace(array(":userId",":userPassword"),array($id,$mdp),$loginRequest);
    $db = connectDb();
    $exec = mysqli_query($db,$requete);
    $resultats = mysqli_fetch_assoc($exec);
    $nbLignes = mysqli_num_rows($exec);

    if ($nbLignes == 1){
        $_SESSION["id_user"] = $resultats["Id_Utilisateur"];
        $_SESSION["nom_user"] = $resultats["Nom"];
        $_SESSION["prenom_user"] = $resultats["Prenom"];
        $_SESSION["role_user"] = $resultats["Role"];
        header("Location: http://gpophp/php/controller/acceuil.php");
    }else{
        $_SESSION["erreur"] = ["Erreur: mot de passe ou identifiant incorrect."];
        header("Location: http://gpophp/index.php");
    }

    $db->close();
    mysqli_free_result($exec);
}

function getReponsesDeroulant($idQuestion){ //Recuperer les reponses d'un déroulant...
                                            // Réutiliser la fonction après getIdSousQuestion pour les sous déroulants S'il y a des réponses associées
    global $reponsesRequest;
    $tabResultats = [];
    $requete = str_replace(":idQuestion",$idQuestion,$reponsesRequest);
    $db = connectDb();
    $exec= mysqli_query($db,$requete);
    $nbLignes = mysqli_num_rows($exec);
    while ($ligne = mysqli_fetch_assoc($exec)){

        array_push($tabResultats,$ligne);
    }
    mysqli_free_result($exec);
    $db->close();
    return $tabResultats;
}

function getIdSousQuestionDeroulant($idQuestionPrincipale, $idReponse){ // ... Puis retrouver l'ID de la "sous-question" liée (expression questionLiee)
                                                               //  à la combinaison ID_question et Id_Reponse.. Seulement si il en a une.
    global $sousDeroulantRequest;
    $tabResultats = [];
    $requete = str_replace(array(":idQuestionLiee",":idReponseLiee"),array($idQuestionPrincipale,$idReponse),$sousDeroulantRequest);
    $db = connectDb();
    $exec= mysqli_query($db,$requete);
    $nbLignes = mysqli_num_rows($exec);
    if($nbLignes > 0){
        while ($ligne = mysqli_fetch_assoc($exec)){
            array_push($tabResultats,$ligne);
        }
        mysqli_free_result($exec);
        $db->close();
        //var_dump($tabResultats);
        return $tabResultats;
    }else{
        return false;
    }
}

function getChoixQuestion($idQuestion){
    global $choixquestionRequest;
    $tabResultats = [];
    $requete = str_replace(":idQuestion",$idQuestion,$choixquestionRequest);
    $db = connectDb();
    $exec = mysqli_query($db,$requete);
    while ($ligne = mysqli_fetch_assoc($exec)){
        array_push($tabResultats,$ligne);
    }
    mysqli_free_result($exec);
    $db->close();
    return $tabResultats;
}

function getQuestions($idForm, $numGroupe){
    $resultats = [];
    $db = connectDb();
    $requete = "SELECT *, SUBSTRING_INDEX(SUBSTRING_INDEX(Q.questionLiee,'Q',-1),'R',1) AS idQuestionLiee
                FROM question Q, avoir A, type_formulaire TF WHERE Q.ID_Question = A.ID_Question AND A.ID_Type = TF.ID_Type AND A.ID_Type = '$idForm'
                 AND A.numGroupe = '$numGroupe' AND Q.affichage = 1 ORDER BY Q.Ordre_Question";
    $exec = mysqli_query($db, $requete);
    while ($ligne = mysqli_fetch_assoc($exec)){
        $resultats[] = $ligne;
    }
    mysqli_free_result($exec);
    $db->close();
    return $resultats;
}
function getQuestion($idQuestion){
    global $questionRequest;
    $resultats = [];
    $db = connectDb();
    $requete = str_replace(":idQuestion", $idQuestion, $questionRequest);
    $exec = mysqli_query($db, $requete);
    while ($ligne = mysqli_fetch_assoc($exec)){
        array_push($resultats,$ligne);
    }
    mysqli_free_result($exec);
    $db->close();
    return $resultats;
}

function getGrpQuestion($idForm){
    $groupes = [];
    $db = connectDb();
    $requete = "SELECT DISTINCT numGroupe FROM avoir A WHERE ID_Type = '$idForm'";
    $exec = mysqli_query($db, $requete);
    while ($ligne = mysqli_fetch_assoc($exec)){
        array_push($groupes,$ligne["numGroupe"]);
    }
    mysqli_free_result($exec);
    $db->close();
    return $groupes;
}

function getNbGroupes($idTypeForm){
    global $groupesQuestionRequest;
    $resultat = null;
    $db = connectDb();
    $requete = str_replace(":idTypeForm",$idTypeForm,$groupesQuestionRequest);
    $exec = mysqli_query($db,$requete);
    while ($ligne = mysqli_fetch_assoc($exec)){
        $resultat = $ligne["nbGroupes"];
    }
    mysqli_free_result($exec);
    $db->close();
    return $resultat;
}

// fonctions Sans SQL



function connectDb(){
    $db = mysqli_connect("localhost","root","","gpophp","3308");
    return $db;
}

function checkNotLogged(){
    if (!isset($_SESSION["id_user"])){
        $_SESSION["erreur"] = ["Erreur: vous devez d'abord vous connecter."];
        header("Location: http://gpophp/index.php");
    }
}

function checkLogged(){
    if (isset($_SESSION["id_user"])){
        header("Location: php/controller/acceuil.php");
    }
}

function logout(){
    session_destroy();
    header("Location: http://gpophp/index.php");
}

function checkQuestion(){

}