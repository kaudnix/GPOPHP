<?php ?>
<form method="post" name="formulaireReferend">
    <div class="row">
        <div class="col-md-12">
            <?php
            $compteurGrp = 0; // si 0, pas de "question précédente"
            $nbreGroupes = getNbGroupes(1);
            foreach ($groupesQuestions as $unGroupe){ // pour chaque groupe de question -> pour chaque question?>
                        <div class="form-group text-center question d-none" data-group-nb="groupe<?php echo $unGroupe; ?>">
                             <?php  $resultats = getQuestions(1, $unGroupe);
                                foreach ($resultats as $uneQuestion){
                                    if($uneQuestion['Type_Question'] == "deroulant"){ ?>
                                        <h3><?php echo $uneQuestion['Libel_Question'];?></h3>
                                        <select class="form-control mb-2" name="<?php echo $uneQuestion['Libel_Question'];?>" data-model="Deroulant<?php echo $uneQuestion["ID_Question"]; ?>" data-id-question="<?php echo $uneQuestion["ID_Question"]; ?>" onchange="getFormation3()">
                                            <option value="" selected="selected">Veuillez choisir un élément</option>
                                            <?php foreach ($tabClassesLycee = getReponsesDeroulant($uneQuestion["ID_Question"]) as $uneOption){ ?>
                                                <option data-id-reponse="<?php echo $uneOption["Id_Reponse"];?>" value="<?php echo $uneOption["Libel_rep"];?>"><?php echo $uneOption["Libel_rep"];?></option>
                                           <?php } ?>
                                        </select>
                                <?php }elseif ($uneQuestion['Type_Question'] == "checkbox"){ //Si en BDD il y a une question liée, créer un input checkbox spécifique
                                        echo '<h3>'.$uneQuestion["Libel_Question"].'</h3>';
                                        echo '<div class="col-md-4 mx-auto">';
                                        if (isset($uneQuestion["idQuestionLiee"]) && $uneQuestion["idQuestionLiee"] != "" ) {;
                                            echo '<label><input onclick="getQuestion()" type="checkbox" data-qLiee="'.$uneQuestion["idQuestionLiee"].'" name="'.$uneQuestion["ID_Question"].'">'.$uneQuestion["Libel_Question"].'</label>';
                                        } else {
                                            echo '<label><input type="checkbox" name="'.$uneQuestion["ID_Question"].'">'.$uneQuestion["Libel_Question"].'</label>';
                                        }
                                        echo '</div>';
                                    }elseif($uneQuestion['Type_Question'] == "checkboxGroup") {
                                        echo '<h3>'.$uneQuestion["Libel_Question"].'</h3>';
                                        echo '<div class="col-md-4 mx-auto">';
                                        foreach ($tabChoix = getChoixQuestion($uneQuestion["ID_Question"]) as $unChoix) {
                                            echo '<label><input type="checkbox" data-ordre="' . $unChoix["Ordre_Choix"] . '">' . $unChoix["Libel_Choix"] . '</label>';
                                        }
                                        echo '</div>';
                                    } else{?>
                                <h3><?php echo $uneQuestion['Libel_Question'];?></h3>
                                <input name="<?php echo $uneQuestion['Libel_Question']; ?>" data-model="<?php echo $uneQuestion["ID_Question"]; ?>" class="form-control w-75 mx-auto" id="question" type="<?php echo $uneQuestion['Type_Question']; ?>"
                                       placeholder="<?php echo $uneQuestion['Libel_Question']; ?>" required="required">
                                <?php  }} ?>
                                    <div class="row mt-5 w-100 mx-auto">
                                        <?php if($compteurGrp != 0){?>
                                    <p class="pointer mr-auto font2rem" data-group-nb="<?php echo ($compteurGrp-1);?>" onclick="changeQuestion(<?php echo ($compteurGrp-1);?>)">Précédent</p>
                                <?php  } if ($compteurGrp < intval($nbreGroupes)-1){?>
                                <p class="pointer ml-auto font2rem"  data-group-nb="<?php echo ($compteurGrp+1);?>" onclick="changeQuestion(<?php echo ($compteurGrp+1);?>)">Suivant</p>
                                        <?php } ?>
                            </div>
                        </div>
                            <?php $compteurGrp++; }?>
            <div class="text-center mb-5">
                <button type="submit" class="btn btn-primary btn-lg d-none" id="validForm">Valider</button>
            </div>
        </div>
    </div>
</form>

<div class="d-none" data-model="divSousDeroulant">
    <select name="" data-model="sousDeroulant"></select>
    <input class="form-control">

</div>