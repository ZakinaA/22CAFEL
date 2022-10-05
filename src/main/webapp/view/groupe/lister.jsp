<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="java.util.ArrayList" %>
<%@include file="../entete.jsp" %>

<div class="container px-4 px-lg-5 custom-container">
<br/>


<%
    ArrayList<Groupe> lesGroupes = (ArrayList)request.getAttribute("pLesGroupes");
%>

<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Les groupes :</b>
                    </div>
    <table  class="table table-curved table-normanzik">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Genre</th>
            <th>Membre contact</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (Groupe unGroupe : lesGroupes) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println("&#128279 <a href ='../ServletGroupe/consulter?idGroupe=" + unGroupe.getId() + "'>");
                    out.println(unGroupe.getNom());
                    out.println("</a></td>");

                    out.println("<td>");
                    out.println(unGroupe.getGenre().getLibelle());
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
        <br>
    <a href="http://localhost:8080/normanzik/ServletGroupe/ajouter">
        <button type="button" class="btn btn-normanzik">S'inscrire</button>
    </a>
        
</div>
</body>
</html>