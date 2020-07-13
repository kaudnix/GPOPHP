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

function getFormation(libelQuestion) {
    let xml, premierMenu ,categorie;
    premierMenu = document.getElementById(libelQuestion);
    categorie = premierMenu.options[premierMenu.selectedIndex].text;
    xml = new XMLHttpRequest();
    xml.onreadystatechange =function () {
        if (this.readyState === 4 && this.status === 200){
            document.getElementById(libelQuestion+"sousDeroulant").innerHTML = this.responseText;
            console.log(categorie);
            if (document.getElementById(libelQuestion+"sousDeroulant").childNodes[0].options.length == 0){
                document.getElementById(libelQuestion+"sousDeroulant").classList.add("d-none");
            }
        }
    };
    xml.open("GET","../templates/getFormation.php?category="+categorie,true);
    xml.send();
    document.getElementById(libelQuestion+"sousDeroulant").classList.remove("d-none");
};