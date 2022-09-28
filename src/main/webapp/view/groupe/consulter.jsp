<%@page import="model.Titre"%>
<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
</head>
<body>
<h1>Consulter Groupe</h1>
<br/>

<%
    Groupe unGroupe = (Groupe)request.getAttribute("pGroupe");
%>
<%
out.println("<b>Nom : </b>" + unGroupe.getNom() + "</br>");
out.println("<b>Date de création : </b>" + unGroupe.getDateCreation() + "</br>");
out.println("<b>Genre : </b>" + unGroupe.getGenre().getLibelle() + "</br>");
out.println("<b>Telephone : </b>" + unGroupe.getTelephone() + "</br>");
out.println("<b>Site Web : </b>" + unGroupe.getSiteWeb() + "</br>");
out.println("<b>Mail : </b>" + unGroupe.getMail() + "</br>");
out.println("<b>Lieu répétition : </b>" + unGroupe.getLieuRepetition() + "</br>");

out.println("<b>Membre contact : </b>" + unGroupe.getLeMembreContact().getNom() + " " + unGroupe.getLeMembreContact().getPrenom() + "</br></br>");

out.println("<b>Les membres du groupe : </b>");
%>

<table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Nom</th>
            <th>Prenom</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (int i=0; i<unGroupe.getLesMembres().size(); i++) {
                    Membre unMembre = unGroupe.getLesMembres().get(i);
                    out.println("<tr><td>");
                    out.println(unMembre.getId());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println("<a href ='../ServletMembre/consulter?idMembre=" + unMembre.getId() + "'>");
                    out.println(unMembre.getNom());
                    out.println("</a></td>");
                    
                    
                    out.println("<td>");
                    out.println(unMembre.getPrenom());
                    out.println("</td>");
                    
                    
                }
            %>
        </tr>
        </tbody>
    </table>
        <%
        out.println("</br> </br><b>Les titres du groupe : </b>");
        %>
        <table>
        <thead>
        <tr>
            <th>Numéro</th>
            <th>Intitulé</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (int i=0; i<unGroupe.getLesTitres().size(); i++) {
                    Titre unTitre = unGroupe.getLesTitres().get(i);
                    out.println("<tr><td>");
                    out.println(unTitre.getNumero());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unTitre.getIntitule());
                    out.println("</td>");
                    
                    
                }
            %>
        </tr>
        </tbody>
    </table>
        


</body>
</html>