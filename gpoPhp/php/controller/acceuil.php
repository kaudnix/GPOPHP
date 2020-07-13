<?php
    session_start();
    require "../model/scripts.php";
    $titre = "Connexion portes ouvertes";
    checkNotLogged();
    $groupesQuestions = getGrpQuestion(1);
    $tabClassesLycee = null;
?>

<?php require "../templates/head.php"; ?>
<?php require "../templates/sidebar.php"; ?>
<?php require "../templates/modaleForm.php"; ?>
<?php require "../templates/scripts.php"; ?>


