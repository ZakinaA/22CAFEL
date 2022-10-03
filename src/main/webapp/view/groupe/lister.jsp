<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
<div class="container px-4 px-lg-5">
<h1>Lister Groupe</h1>
<br/>


<%
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pLesGroupes");
%>



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
        
    <a href="http://localhost:8080/normanzik/ServletGroupe/ajouter">
        <button type="button" class="btn btn-primary">S'inscrire</button>
    </a>
        
</div>
</body>
</html>