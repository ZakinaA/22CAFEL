<%-- 
    Document   : consulter
    Created on : 17 oct. 2022, 11:28:04
    Author     : sio2
--%>

<%@page import="model.Groupe"%>
<%@page import="model.Membre"%>
<%@page import="model.Festival"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
    <div class="container px-4 px-lg-5 custom-container">
<br/>

<div class="container">
  <div class="row">
        
<%
    Festival unFestival = (Festival)request.getAttribute("pFestival");

   
%>

<div class="col-sm">
                <div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Festival</b>
                    </div>
                    <ul class="list-group list-group-flush">
                <li class="list-group-item"><% out.println("<b>Nom : </b>" + unFestival.getFest_nom() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Date de début : </b>" + unFestival.getFest_dateDebut() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Date de fin : </b>" + unFestival.getFest_dateFin() + "</br>");%></li>
                <li class="list-group-item"><%out.println("<b>Telephone : </b>" + unFestival.getFest_lieu() + "</br>");%></li>
                </ul>
                </div>
            </div>
<div class="col-sm">
                <div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Groupes participant :</b>
                    </div>
                    <table class="table bg-normanzik">
                        <thead>
                            <tr>
                            <th>Nom</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <%
                            for (int i=0; i<unFestival.getLesGroupes().size(); i++) {
                            Groupe unGroupe = unFestival.getLesGroupes().get(i);
                            out.println("<tr>");
                    
                            out.println("<td>");
                            out.println("&#128279 <a href ='../ServletGroupe/consulter?idGroupe=" + unGroupe.getId() + "'>");
                            out.println(unGroupe.getNom());
                            out.println("</a></td>");
      
                    
                            }
                           
                            %>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        <%@include file="../pied.jsp"%>
    </body>
</html>
