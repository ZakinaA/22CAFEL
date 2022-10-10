<%-- 
    Document   : connexion
    Created on : 10 oct. 2022, 11:35:36
    Author     : sio2
--%>

<%@page import="form.FormUtilisateur"%>
<%@page import="form.FormMembre"%>
<!DOCTYPE html>
<html>
<h1>Ajouter Membre</h1>
<br/>


<%
    //Client client=(Client)request.getAttribute("client");
    FormUtilisateur form = (FormUtilisateur)request.getAttribute("form");
%>

<form class="form-inline" action="ajouter" method="POST">
    <label for="nom">Nom : </label>
    <input id="nom" type="text" name="nom"  size="70" maxlength="70">
    <span style="color: blue;">${form.erreurs['nom']}</span>
    <br />
    </br>
    </br>
    <label for="prenom">Prénom : </label>
    <input id="prenom"  type="date"  name="prenom" size="10" maxlength="10">
    <span style="color: blue;">${form.erreurs['prenom']}</span>
    </br>
    
    </br>
    </br>
    <%-- Champ Liste des genres --%>
    <label for="instrument">Instrument : </label>
    <select name="idInstrument">
    </select>
    
    </br>
    </br>
    
    <label for="statut">Statut : </label>
    <select name="idStatut">
    </select>
    </br>
    </br>
    <input type="submit" name="valider" id="valider" value="Valider"/>
</form>
    <%@include file="../pied.jsp"%>
</body>
</html>