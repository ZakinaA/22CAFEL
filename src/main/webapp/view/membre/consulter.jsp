<%-- 
    Document   : consulter
    Created on : 21 sept. 2022, 11:17:02
    Author     : sio2
--%>

<%@page import="model.Groupe"%>
<%@page import="model.Membre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
<div class="container px-4 px-lg-5">
<h1 style="text-align: center;">Consulter Membre :</h1>
<br/>

<div class="container">
  <div class="row">
      <div class="col-sm">
                <%
    Membre leMembre = (Membre)request.getAttribute("pMembre");
%>
<div class="card">
                <div class="card-header">
                    <b>Informations membre :</b>
                </div>
                <ul class="list-group list-group-flush">
                <li class="list-group-item"><% out.println("<b>Nom : </b>" + leMembre.getNom() + "</br>");%></li>
                <li class="list-group-item"><% out.println("<b>Prénom : </b>" + leMembre.getPrenom() + "</br>");%></li>
                <li class="list-group-item"><% out.println("<b>Instrument principal : </b>" + leMembre.getUnInstrument().getLibelle() + "</br>");%></li>
                </ul>
            </div>
                
                    
                </ul>
            </div>
      </div>
  </div>

<br>
<input class="btn btn-primary" type="button" value="Retour" onclick="history.back()">
</div>
</body>
</html>
