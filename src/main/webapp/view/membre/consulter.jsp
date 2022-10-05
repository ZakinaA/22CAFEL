<%-- 
    Document   : consulter
    Created on : 21 sept. 2022, 11:17:02
    Author     : sio2
--%>

<%@page import="model.Groupe"%>
<%@page import="model.Membre"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="../css/custom.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="../css/custom.css" rel="stylesheet">
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
<div class="card bg-normanzik">
                <div class="card-header">
                    <b>Informations membre :</b>
                </div>
                <ul class="list-group list-group-flush">
                <li class="list-group-item"><% out.println("<b>Nom : </b>" + leMembre.getNom() + "</br>");%></li>
                <li class="list-group-item"><% out.println("<b>Prénom : </b>" + leMembre.getPrenom() + "</br>");%></li>
                <li class="list-group-item"><% out.println("<b>Instrument principal : </b>" + leMembre.getUnInstrument().getLibelle() + "</br>");%></li>
                </ul>
</div>
                
                    
               
            </div>
      </div>
  </div>

<br>
<input class="btn btn-normanzik" type="button" value="Retour" onclick="history.back()">
</div>
</body>
</html>
