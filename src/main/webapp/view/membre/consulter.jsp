<%-- 
    Document   : consulter
    Created on : 21 sept. 2022, 11:17:02
    Author     : sio2
--%>

<%@page import="model.Groupe"%>
<%@page import="model.Membre"%>
<%@include file="../entete.jsp" %>
<html>
<div class="container px-4 px-lg-5">
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
