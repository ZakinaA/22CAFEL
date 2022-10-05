<%@page import="model.Titre"%>
<%@page import="model.Membre"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@include file="../entete.jsp" %>

<body>
    <%
    Groupe unGroupe = (Groupe)request.getAttribute("pGroupe");
%>
<div class="container px-4 px-lg-5">
<br/>


<div class="container">
  <div class="row">
      <div class="col-sm">
            <div class="card bg-normanzik">
                <div class="card-header">
                    <b>Informations groupe :</b>
                </div>
                <ul class="list-group list-group-flush">
                <li class="list-group-item"><% out.println("<b>Nom : </b>" + unGroupe.getNom() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Date de création : </b>" + unGroupe.getDateCreation() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Genre : </b>" + unGroupe.getGenre().getLibelle() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Telephone : </b>" + unGroupe.getTelephone() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Site Web : </b>" + unGroupe.getSiteWeb() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Mail : </b>" + unGroupe.getMail() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Lieu répétition : </b>" + unGroupe.getLieuRepetition() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Membre contact : </b>" + unGroupe.getLeMembreContact().getNom() + " " + unGroupe.getLeMembreContact().getPrenom() + "</br>");%></li>
                </ul>
            </div>
        </div>
            <div class="col-sm">
                <div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Membres :</b>
                    </div>
                    <table class="table bg-normanzik">
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
                            out.println("&#128279 <a href ='../ServletMembre/consulter?idMembre=" + unMembre.getId() + "'>");
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
                </div>
            </div>
    </div>
</div>
            
<br>            

        <div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Les titres du groupes :</b>
                    </div>
        <table class="table bg-normanzik">
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
        </div>
        <br>
        
<a href="http://localhost:8080/normanzik/ServletGroupe/lister">
    <button type="button" class="btn btn-normanzik">Retour</button>
</a>
        
</div>
</body>
</html>