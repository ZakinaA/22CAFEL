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
</head>
<body>
<h1>Consulter Membre</h1>
<br/>

<%
    Membre leMembre = (Membre)request.getAttribute("pMembre");
%>
<%
out.println("<b>Nom : </b>" + leMembre.getNom() + "</br>");
out.println("<b>Prénom : </b>" + leMembre.getPrenom() + "</br>");
out.println("<b>Instrument principal : </b>" + leMembre.getUnInstrument().getLibelle() + "</br>");
out.println("<b>Statut : </b>" + leMembre.getUnStatut().getLibelle() + "</br>");

out.println("<b>Les groupes du membre : </b>");

/*for (int i=0; i<leMembre.getLesGroupes().size(); i++) {
    Groupe unGroupe = leMembre.getLesGroupes().get(i);
    out.println(unGroupe.getNom());
    }*/
%>


</body>
</html>
