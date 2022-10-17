<%@page import="form.FormInscription"%>
<%@page import="model.Statut"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Membre"%>
<%@ page import="form.FormMembre" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="../entete.jsp" %>
<html>
<br/>


<%
    //Client client=(Client)request.getAttribute("client");
    FormInscription form = (FormInscription)request.getAttribute("form");
%>
    <%@include file="../pied.jsp"%>

<div class="container px-4 px-lg-5 custom-container">
<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>S'inscrire</b>
                    </div>
<form class="form-inline" action="inscription" method="POST">
    <ul class="list-group list-group-flush">
    <li class="list-group-item">Identifiant :
    <input id="username" type="text" name="username" maxlength="20">
    <span style="color: blue;">${form.erreurs['identifiant']}</span>
    </li>

    
    <li class="list-group-item">Mot de passe :
    <input id="password"  type="password"  name="password" maxlength="20">
    <span style="color: blue;">${form.erreurs['password']}</span>
    </li>
 
    
    <!--<li class="list-group-item">Confirmation du Mot de passe :
    <input id="password"  type="password"  name="password" maxlength="20">
    <span style="color: blue;">${form.erreurs['password']}</span>
    </li>-->
    
    
    <li class="list-group-item">
    <a href="../ServletConnexion/connexion" class="card-link">Se Connecter</a>
    </li>
    </ul>   
</div>
    </br>
        <input class="btn btn-normanzik" type="submit" name="valider" id="valider" value="Valider"/>  
</form>
</body>
</html>
