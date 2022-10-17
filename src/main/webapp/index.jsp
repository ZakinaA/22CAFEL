<style>
    
     .footer{
        background-color: rgba(255,255,255,0.75);  
        position:fixed;
        bottom: 0;
        width:100%;
    }
    .pied{
       width:100%;
       
    }
    .pied td a{
        color: #5e3f9c;
        text-align: center;
        text-decoration: none;
    }
    
    .pied td a:hover{
        color: white;
        transition: 0.3s all;
    }
    
    .header{
        background-color: rgba(255,255,255,0.75);
}
    
    .imgen{
        position: relative;
        left: 96%;
        top: -45px;
        height: 30px;
        
    }
    
    .tn{
        text-align:center;
        color: #5e3f9c;
        font-size: 2%;
        text-decoration: none;
    }
    .tn:hover{
        color: white;
        transition: 0.8s all;
    }
    
    .entete{
        width:100%;
        margin-top: -35px;
    }
    .entete td{
        text-align : center;
    }
    
    .entete td a{
        color: #5e3f9c;
        text-decoration: none;
        font-size: 125%;
        margin-top: -20px;
    }
    
    .entete td a:hover{
        color: white;
        transition: 0.3s all;
    }
</style>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="css/custom.css" rel="stylesheet">
</head>
<body>
    <header class="header">
        <a class="tn" href=""><h1>Norman'Zik</h1></a>
        <%
        
            out.println(session.getAttribute("role"));
if(session.getAttribute("identifiant") == "null"){
                  out.println("<a href='./ServletConnexion/connexion'><img class='imgen' src='./img/img_entete.png'></a>"); 
            }
            else{
             out.println("<a href='./ServletConnexion/profil'><img class='imgen' src='./img/img_entete.png'></a>"); 
            }%>
   
            
            
            <table class="entete">
                    <tr>
                        <td><a href="./ServletConcert/lister">Concerts</a></td>
                        <td><a href="./ServletFestival/lister">Festivals</a></td>
                        <td><a href="./ServletGroupe/lister">Groupes</a></td>
                    </tr>
                </table>
            
            
 
    </header>
<div class="container px-4 px-lg-5 custom-container">
<br/>

<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Bienvenue</b>
                    </div>
     <div class="card-body">
    <h5 class="card-title">Accueil</h5>
    <h6 class="card-subtitle mb-2 text-muted">Votre plateforme de musique !</h6>
    <p class="card-text"></p>
    <p class="card-text">Bienvenue sur Norman'Zik :</p>
    <a href="http://localhost:8080/normanzik/ServletGroupe/lister" class="card-link">Voir les groupes</a>
    <a href="http://localhost:8080/normanzik/ServletConcert/lister" class="card-link">Voir les concerts</a>
  </div>
</div>
</div>
    <footer class="footer">
     <table class="pied">
                    <tr>
                        <td><a href="#">Mention legal</a></td>
                        <td><a href="#">Politique de confidentialité</a></td>
                        <td><a href="#">RGPD</a></td>
                        <td><a href="#">A Propos</a></td>
                        <td><a href="#">Contact</a></td>
                        <td><a href="#">Copyright 2022</a></td>
                    </tr>
                </table>
</footer>
</body>
