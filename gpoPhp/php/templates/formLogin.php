<?php ?>

<div class="row">
    <div class="col-md-12">
        <form method="POST" action="php/controller/login.php">
            <div class="form-group text-center">
                <label for="identifiant">Identifiant</label>
                <input type="text" name="id" class="form-control w-50 mx-auto" id="identifiant" aria-describedby="emailHelp" placeholder="Entrez l'identifiant">
            </div>
            <div class="form-group text-center">
                <label for="password">Mot de passe</label>
                <input type="password" name="mdp" class="form-control w-50 mx-auto" id="password" placeholder="Mot de passe">
            </div>
            <div class="text-center mb-5">
                <button type="submit" class="btn btn-primary">Se connecter</button>
            </div>
        </form>
    </div>
</div>

<?php
    if (isset($_SESSION["erreur"])){
        foreach ($_SESSION["erreur"] as $uneErreur){ ?>
            <div class="alert alert-danger mx-auto w-50" role="alert">
                <?php echo $uneErreur; ?>
            </div>
        <?php   }
    }
?>
