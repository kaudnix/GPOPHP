<?php ?>

<div class="pointer" id="sidebarToggler" onclick="toggleSidebar(0)">
    <div class="hamburger"></div>
    <div class="hamburger"></div>
    <div class="hamburger"></div>
</div>

<div class="sideBar" id="sidebar">
    <div class="fontWhite">
        <div class="row">
            <span class="mr-5 pointer ml-auto" id="sidebarOff" onclick="toggleSidebar(1)">×</span>
        </div>
        <div class="row">
            <p class="mx-auto mt-4">Bonjour, <?php echo $_SESSION["prenom_user"]; ?></p>
        </div>
        <div class="row">
            <p class="mx-auto mt-4">Formulaire</p>
            <div class="col-md-12">
                <div class="sideBarList">
                    <a class="sideBarList" href="#"> Remplir </a>
                    <a class="sideBarList" href="#"> Modifier </a>
                </div>
            </div>
            <a class="btn btn-danger logout" href="http://gpophp/php/controller/logout.php">Se deconnecter</a>
        </div>
    </div>
</div>
