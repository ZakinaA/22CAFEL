<%-- 
    Document   : connexion
    Created on : 10 oct. 2022, 11:35:36
    Author     : sio2
--%>

<%@page import="form.FormConnexion"%>
<%@page import="form.FormMembre"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
<body>
    
<br/>



    <%@include file="../pied.jsp"%>

<div class="container px-4 px-lg-5 custom-container">
<form class="form-inline" action="profil" method="GET">
<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Connect� en tant que <%out.println(session.getAttribute("identifiant"));%></b>
                    </div>  
                    
</div>
                    <br>                    
<input class="btn btn-normanzik" type="submit" name="logout" id="logout" value="Deconnexion"">
</form>
                    
</body>
</html>