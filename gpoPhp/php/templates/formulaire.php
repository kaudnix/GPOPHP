<?php ?>
<form method="post" name="formulaireReferend">
    <div class="row">
        <div class="col-md-12">
            <?php
            $compteurGrp = 0; // si 0, pas de "question précédente"
            foreach ($groupesQuestions as $unGroupe){ // pour chaque groupe de question -> pour chaque question?>
                        <div class="form-group text-center question d-none" id="groupe<?php echo $unGroupe; ?>">
                             <?php  $resultats = getQuestions(1, $unGroupe);
                                foreach ($resultats as $uneQuestion){
                                    //switch ($uneQuestion['Type_Question']) {
                                      //  case "checkbox":
                                            //echo "lol";
                                        //    break;
                                        //case "radio":
                                         //   break;
                                   // }
                                    if($uneQuestion['Type_Question'] == "deroulant"){ ?>
                                        <h3><?php echo $uneQuestion['Libel_Question'];?></h3>
                                        <select class="form-control" name="<?php echo $uneQuestion['Libel_Question'];?>" id="<?php echo $uneQuestion['Libel_Question'];?>" onchange="getFormation('<?php echo $uneQuestion['Libel_Question'];?>')">
                                            <option value="" selected="selected">Veuillez choisir un élément</option>
                                            <?php foreach ($tabClassesLycee = listeDeroulant($uneQuestion["ID_Question"]) as $uneOption) { ?>
                                                <option value="<?php echo $uneOption["libelRepDeroulant"];?>"><?php echo $uneOption["libelRepDeroulant"];?></option>
                                           <?php } ?>
                                        </select>
                                        <div class="form-group d-none mt-2" id="<?php echo $uneQuestion['Libel_Question'];?>sousDeroulant">

                                        </div>
                                <?php }else{?>
                                <h3><?php echo $uneQuestion['Libel_Question'];?></h3>
                                <input name="<?php echo $uneQuestion['Libel_Question']; ?>" class="form-control w-75 mx-auto" id="question" type="<?php echo $uneQuestion['Type_Question']; ?>"
                                       placeholder="<?php echo $uneQuestion['Libel_Question']; ?>" required="required">
                                <?php  }} ?>
                                    <div class="row mt-5 w-100 mx-auto">
                                        <?php if($compteurGrp != 0){?>
                                    <p class="pointer mr-auto font2rem" onclick="changeQuestion(<?php echo ($compteurGrp-1);?>)">Précédent</p>
                                <?php  } ?>
                                <p class="pointer ml-auto font2rem" onclick="changeQuestion(<?php echo ($compteurGrp+1);?>)">Suivant</p>
                            </div>
                        </div>
                            <?php $compteurGrp++; }?>
            <div class="text-center mb-5">
                <button type="submit" class="btn btn-primary btn-lg d-none" id="validForm">Valider</button>
            </div>
        </div>
    </div>
</form>