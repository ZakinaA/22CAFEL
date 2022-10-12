<%-- 
    Document   : connexion
    Created on : 10 oct. 2022, 11:35:36
    Author     : sio2
--%>

<%@page import="form.FormUtilisateur"%>
<%@page import="form.FormMembre"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
<br/>


<%
    //Client client=(Client)request.getAttribute("client");
    FormUtilisateur form = (FormUtilisateur)request.getAttribute("form");
%>
    <%@include file="../pied.jsp"%>

<div class="container px-4 px-lg-5 custom-container">
<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Se connecter</b>
                    </div>


    <form class="form-inline" method="POST">
    <ul class="list-group list-group-flush">
    <li class="list-group-item">Identifiant :
    <input id="nom" type="text" name="identifiant" maxlength="70">
    <span style="color: blue;">${form.erreurs['identifiant']}</span></li>
 
    <li class="list-group-item">Mot de passe :
    <input id="telephone"  type="password"  name="telephone" maxlength="20">
    <span style="color: blue;">${form.erreurs['motdepasse']}</span>
    </li>
    <li class="list-group-item">
    <a href="http://localhost:8080/normanzik/ServletUtilisateur/inscription" class="card-link">S'inscrire</a>
    </li>
    </ul>
    </div>
    <br>
    <button type="submit" class="btn btn-normanzik">Se connecter</button>
</form>    
</body>
</html>