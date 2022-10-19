<%-- 
    Document   : connexion
    Created on : 10 oct. 2022, 11:35:36
    Author     : sio2
--%>

<%@page import="model.Membre"%>
<%@page import="form.FormConnexion"%>
<%@page import="form.FormMembre"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
    <%
        
            if(session.getAttribute("identifiant") == null){
                  response.sendRedirect("../index.jsp"); 
            }%>
<body>
    
<br/>



    <%@include file="../pied.jsp"%>

<div class="container px-4 px-lg-5 custom-container">
<form class="form-inline" action="profil" method="GET">
<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Profil - Connecté en tant que : <%out.println(session.getAttribute("identifiant"));%></b>
                    </div>
                    <div class="card-body">
                        <p class="card-text"><b>Nom : </b><%out.println(session.getAttribute("membreNom"));%></p>
                        <p class="card-text"><b>Prenom : </b><%out.println(session.getAttribute("membrePrenom"));%></p>
                        <p class="card-text"><b>Role : </b><%out.println(session.getAttribute("roleLibelle"));%></p>
                    </div>
                    
</div>
                    <br>                    
<input class="btn btn-normanzik" type="submit" name="logout" id="logout" value="Deconnexion"">
</form>                  
</body>
</html>