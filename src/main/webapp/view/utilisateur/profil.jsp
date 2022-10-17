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
<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Connecté en tant que <%out.println(session.getAttribute("identifiant"));%></b>
                    </div>  
</body>
</html>