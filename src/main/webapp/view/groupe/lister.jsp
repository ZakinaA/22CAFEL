<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
</head>
<body>
<h1>Lister Groupe</h1>
<br/>


<%
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pLesGroupes");
%>


<div class="container px-4 px-lg-5">
    <table  class="table table-bordered table-striped table-condensed">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nom</th>
            <th>dateCreation</th>
            <th>Genre</th>
            <th>Téléphone</th>
            <th>Mail</th>
            <th>Site Web</th>
            <th>Lieu de répétition</th>
            <th>Membre contact</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (Groupe unGroupe : lesGroupes) {
                    out.println("<tr><td>");
                    out.println(unGroupe.getId());
                    out.println("</td>");

                    out.println("<td>");
                    out.println("<a href ='../ServletGroupe/consulter?idGroupe=" + unGroupe.getId() + "'>");
                    out.println(unGroupe.getNom());
                    out.println("</a></td>");

                    out.println("<td>");
                    out.println(unGroupe.getDateCreation());
                    out.println("</td>");

                    out.println("<td>");
                    out.println(unGroupe.getGenre().getLibelle());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unGroupe.getTelephone());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unGroupe.getMail());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unGroupe.getSiteWeb());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unGroupe.getLieuRepetition());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unGroupe.getLeMembreContact().getNom());
                    out.println(" ");
                    out.println(unGroupe.getLeMembreContact().getPrenom());
                    out.println("</td>");
                    
                    
                }
            %>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>