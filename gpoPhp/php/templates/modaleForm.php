<?php ?>

<div id="contenuAcceuil">
    <div class="jumbotron text-center">
        <h1 class="display-4">Remplir formulaire</h1>
        <p class="lead">Cliquez sur le bouton ci-dessous pour commencer</p>
        <hr class="my-4">
        <div class="text-center">
            <button type="button" class="btn btn-primary btn-lg" onclick="changeQuestion(0)">
                Commencer
            </button>
        </div>
    </div>
</div>


<div class="container-fluid">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <?php require "formulaire.php"; ?>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
