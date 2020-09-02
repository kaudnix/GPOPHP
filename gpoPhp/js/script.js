function toggleSidebar(action) {
    let sidebar, contenu;
    contenu = document.getElementById("contenuAcceuil");
    sidebar = document.getElementById("sidebar");
    if (action === 1){ // 1 = close sidebar else = open sidebar
        sidebar.style.whiteSpace="nowrap";
        sidebar.style.width="0px";
        contenu.style.marginLeft="0px";
    }else {
        if (window.matchMedia("(max-width: 420px)").matches){
            sidebar.style.width="190px";
        }else {
            sidebar.style.width = "250px";
            contenu.style.marginLeft = "250px";
        }
    }
};

function changeQuestion(numGrpQuestion) {
    let questions, tabQuestions, submitBtn;
    questions = document.getElementsByClassName("question");
    submitBtn = document.getElementById("validForm");
    tabQuestions = Array.from(questions);
    tabQuestions.forEach(question => question.classList.add("d-none"));
    tabQuestions[numGrpQuestion].classList.remove("d-none");
    submitBtn.classList.remove("d-none");
};

function getFormation2(event) {
    let xml, newDeroulant, premierDeroulant, json, tabReponses, idQues, idRep, deroulantASuppr, idDeroulantASuppr;
    premierDeroulant = event.target;
    idQues = premierDeroulant.getAttribute("data-id-question");
    idRep = premierDeroulant.options[premierDeroulant.selectedIndex].getAttribute("data-value");

    try {
        idDeroulantASuppr = document.querySelector("[data-sousderoulant= SousDeroulant"+idQues+"]").getAttribute("data-deroulant");
    }
    catch (e) {

    }
    //console.log("TEst " + newDeroulant);
    tabReponses = [];
    try {
        deroulantASuppr = document.querySelector("[data-sousderoulant= '"+idDeroulantASuppr+"']");
        deroulantASuppr.remove();
    }catch (e) {

    }
    xml = new XMLHttpRequest();
    xml.onreadystatechange =function () {
        try {
            if (this.readyState === 4 && this.status === 200) {
                json = JSON.parse(this.responseText);
                console.log(json);
                if (json['Libel_rep'][1] === "Précisez"){
                    newDeroulant = document.createElement("input");
                    premierDeroulant.after(newDeroulant);
                    newDeroulant.classList.remove("d-none");
                    newDeroulant.classList.add("form-control");
                    newDeroulant.setAttribute("type","texte");
                    newDeroulant.setAttribute("placeholder",json['Libel_rep'][1]);
                    newDeroulant.setAttribute("data-deroulant", "Deroulant" + json["ID_Question"]);
                    newDeroulant.setAttribute("data-sousderoulant", "SousDeroulant" + idQues);
                    deroulantASuppr = document.querySelector("[data-model='SousDeroulant" + idQues + "']");
                }else {
                    newDeroulant = document.querySelector("[data-model='divSousDeroulant'] select").cloneNode();
                    for (let i in json['Libel_rep']) {
                        tabReponses.push("<option>" + json['Libel_rep'][i] + "</option>");
                        //console.log(tabReponses);
                    }
                    for (let i = 0; i < tabReponses.length; i++) {
                        newDeroulant.innerHTML = tabReponses.join(" ");
                    }
                    premierDeroulant.after(newDeroulant);
                    newDeroulant.classList.remove("d-none");
                    newDeroulant.classList.add("form-control");
                    newDeroulant.setAttribute("data-deroulant", "Deroulant" + json["ID_Question"]);
                    newDeroulant.setAttribute("data-sousderoulant", "SousDeroulant" + idQues);
                    deroulantASuppr = document.querySelector("[data-model='SousDeroulant" + idQues + "']");
                }
            }
        }catch (e) {
            console.log(e);
        }
    };
    xml.open("GET","../templates/getFormation.php?idQuestion="+idQues+"&idReponse="+idRep,true);
    xml.send();
};

function getFormation3() {
    let currentQuestion,newDiv, newQuestion, xml, json, idQues, idRep;
    currentQuestion = event.target;
    idQues = currentQuestion.getAttribute("data-id-question");
    idRep = currentQuestion.options[currentQuestion.selectedIndex].getAttribute("data-id-reponse");
    //console.log(idQues);
    //console.log(idRep);
    newDiv = document.createElement("div");

        try {
            let questionASuppr = document.querySelector("[data-div-sousquestion='"+idQues+"']");
            console.log(idQues);
            console.log(questionASuppr);
            questionASuppr.remove();

        }catch (e) {
            //console.log(e);
        }
        xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                json = JSON.parse(this.responseText);
                //console.log(json);
                if (json['Libel_rep'][1] === "Précisez") {
                    newDiv.setAttribute("data-div-sousquestion",idQues);
                    newQuestion = document.createElement("input");
                    newQuestion.setAttribute("data-id-sousquestion", json["ID_Question"]);
                    newQuestion.setAttribute("data-id-premierequestion", idQues);
                    newQuestion.setAttribute("type", "texte");
                    newQuestion.setAttribute("name", json["ID_Question"]);
                    newQuestion.setAttribute("placeholder", json["Libel_rep"][1]);
                    newQuestion.classList.add("form-control");
                    currentQuestion.after(newDiv);
                    newDiv.appendChild(newQuestion);
                } else {
                    newDiv.setAttribute("data-div-sousquestion",idQues);
                    newQuestion = document.createElement("select");
                    newQuestion.setAttribute("data-id-question", json["ID_Question"]);
                    newQuestion.setAttribute("data-id-premierequestion", idQues);
                    newQuestion.setAttribute("data-id-sousquestion", idQues);
                    newQuestion.setAttribute("type", "deroulant");
                    newQuestion.setAttribute("name", json["ID_Question"]);
                    newQuestion.classList.add("form-control");
                    newQuestion.addEventListener("change",getFormation3);
                    let firstOption = document.createElement("option");
                    firstOption.setAttribute("data-value","");
                    firstOption.innerText = "Veuillez choisir un élément";
                    newQuestion.appendChild(firstOption);
                    for (let i in json["Libel_rep"]){
                        let newOption = document.createElement("option");
                        newOption.innerText = json["Libel_rep"][i];
                        newOption.setAttribute("data-id-reponse",json["ID_Reponse"][i])
                        newQuestion.appendChild(newOption);
                    }
                    currentQuestion.after(newDiv);
                    newDiv.appendChild(newQuestion);
                }
            }
        };
            xml.open("GET", "../templates/getFormation.php?idQuestion=" + idQues + "&idReponse=" + idRep, true);
            xml.send();

};

    function getQuestion() {
        let currentInput, currentDiv, idQuestions, newDiv, newInput, xml, divASuppr, json;
        currentInput = event.target;
        idQuestions = currentInput.getAttribute("data-qliee").split("-");
        newDiv = document.createElement("div");
        currentDiv = currentInput.parentElement;
        let tab = [];
        if (currentInput.checked === false) {
            try {
                divASuppr = document.querySelector("div[data-questions='" + idQuestions + "']");
                divASuppr.remove();
            } catch (e) {
                // console.log(e);
            }
        } else {
            currentDiv.appendChild(newDiv);
            for (let i of idQuestions) {
                //console.log(i);
                newDiv.setAttribute("data-questions", idQuestions);
                xml = new XMLHttpRequest();
                xml.onreadystatechange = function () {
                    if (this.readyState === 4 && this.status === 200) {
                        json = JSON.parse(this.responseText);

                        tab.push(json);
                        newInput = document.createElement("input");
                        newInput.classList.add("form-control");
                        if (json["Type_Question"] === "checkboxGroup") {
                            newInput.setAttribute("type", "checkbox");
                            newInput.addEventListener("click", getChoixQuestion);
                        } else {
                            newInput.setAttribute("type", json["Type_Question"]);
                        }
                        newInput.setAttribute("data-qliee", json["questionLiee"]);
                        if (newInput.getAttribute("data-qliee") !== "") {
                            newInput.addEventListener("click", getQuestion);
                        }
                        newInput.setAttribute("name", json["Libel_Question"]);
                        newInput.setAttribute("data-question-id",json["ID_Question"]);
                        newInput.setAttribute("placeholder", json["Libel_Question"]);
                        let label = document.createElement("label");
                        label.innerText = json["Libel_Question"];
                        newDiv.appendChild(label);
                        label.appendChild(newInput);
                        label.style.fontSize = "1.65rem";
                        label.classList.add("d-block");
                    }
                };
                xml.open("GET", "../templates/getSousQuestion.php?idQuestion=" + i, true);
                xml.send();
            }

        }
    };

    function getChoixQuestion() {
        let currentInput, currentDiv, newDiv, idQuestion, newInput, newLabel, xml, json;
        currentInput = event.target;
        idQuestion = currentInput.getAttribute("data-question-id");
        newDiv = document.createElement("div");
        currentDiv = currentInput.parentElement;
        currentDiv.appendChild(newDiv);
        if (currentInput.checked === false) {
            try {
                let divASuppr = document.querySelector("div[data-choix-id='" + idQuestion + "']");
                divASuppr.remove();
            } catch (e) {

            }

        } else {
            xml = new XMLHttpRequest();
            xml.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    json = JSON.parse(this.responseText);
                    for (let i in json["Ordre_Choix"]) {
                        newLabel = document.createElement("label");
                        newLabel.innerText = json["Libel_Choix"][i];
                        newLabel.classList.add("d-block");

                        newInput = document.createElement("input");
                        newInput.classList.add("form-control");
                        newInput.setAttribute("name", json["ID_Question"]);
                        newInput.setAttribute("type", "checkbox");
                        newInput.setAttribute("data-question-id", json["ID_Question"]);
                        newInput.setAttribute("data-ordre", json["Ordre_Choix"][i]);

                        newDiv.setAttribute("data-choix-id", idQuestion);
                        newDiv.appendChild(newLabel);
                        newLabel.appendChild(newInput);
                    }
                }
            };
            xml.open("GET", "../templates/getChoixQuestion.php?idQuestion=" + idQuestion, true);
            xml.send();
        }

};

