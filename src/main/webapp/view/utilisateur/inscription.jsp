<%-- 
    Document   : connexion
    Created on : 10 oct. 2022, 11:35:36
    Author     : sio2
--%>

<%@page import="form.FormInscription"%>
<%@page import="form.FormMembre"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
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
    <input id="identifiant" type="text" name="identifiant" maxlength="70">
    <span style="color: blue;">${form.erreurs['identifiant']}</span>
    </li>

    
    <li class="list-group-item">Mot de passe :
    <input id="mdp"  type="password"  name="mdp" maxlength="20">
    <span style="color: blue;">${form.erreurs['mdp']}</span>
    </li>
 
   
    <li class="list-group-item">
    <a href="<%out.print(getServletContext().getContextPath());%>/ServletConnexion/connexion" class="card-link">Se Connecter</a>
    </li>
    </ul>   
</div>
    <br><input class="btn btn-normanzik" type="submit" name="valider" id="valider" value="Valider"/>
</form>     
</body>
</html>