<?php

function connectDb(){
    $db = mysqli_connect("localhost","root","","gpophp","3308");
    return $db;
}

function login($id, $mdp){
    $db = connectDb();
    $requete = "SELECT * FROM utilisateur WHERE Identifiant = '$id' AND Password = '$mdp';";
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
    mysqli_free_result($resultats);
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
function getQuestions($idForm, $numGroupe){
    $resultats = [];
    $db = connectDb();
    $requete = "SELECT * FROM question Q, avoir A, type_formulaire TF WHERE Q.ID_Question = A.ID_Question AND A.ID_Type = TF.ID_Type AND A.ID_Type = '$idForm'
                 AND A.numGroupe = '$numGroupe' AND Q.affichage = 1 ORDER BY Q.Ordre_Question";
    $exec = mysqli_query($db, $requete);
    while ($ligne = mysqli_fetch_assoc($exec)){
        $resultats[] = $ligne;
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

function listeDeroulant($idQuestion){  // listes imbriquées classes
    $listeClasses = [];
    $db = connectDb();
    $requete = "SELECT * FROM question Q, inclure I, reponsederoulant RD WHERE
                 Q.ID_Question = I.ID_Question AND I.idRepDeroulant = RD.idRepDeroulant AND Q.ID_Question = '$idQuestion';";
    $exec = mysqli_query($db,$requete);
    while($ligne = mysqli_fetch_assoc($exec)){
       array_push($listeClasses,$ligne);
    }
    return$listeClasses;
}