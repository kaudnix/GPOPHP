<?php
    session_start();
    require "../model/scripts.php";
    checkLogged();

    login($_POST["id"], $_POST["mdp"]);
