<?php

require "../model/scripts.php";
    $categorie = $_GET["category"];
    $tab = [];
    $db = connectDb();
    $requete = "SELECT * 
                FROM inclure I, question Q, reponsederoulant RD 
                WHERE I.ID_Question = Q.ID_Question AND I.idRepDeroulant = RD.idRepDeroulant
                AND RD.libelRepDeroulant = '$categorie'";
    $exec = mysqli_query($db,$requete);
    $resultat = mysqli_fetch_assoc($exec);


    $tab = listeDeroulant($resultat["questionLiee"]);
    echo "<select class='form-control'>";
    foreach ($tab as $uneFormation => $valeur){
        echo "<option>".$valeur["libelRepDeroulant"]."</option>";
    }
    echo "</select>";

    mysqli_close($db);