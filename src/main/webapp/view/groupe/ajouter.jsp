<%@page import="model.Dispositif"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="form.FormGroupe" %>
<%@ page import="model.Genre" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="../css/custom.css" rel="stylesheet">
    </head>
<body>
<div class="container px-4 px-lg-5">    
<h1>Ajouter Groupe</h1>
<br/>


<%
    //Client client=(Client)request.getAttribute("client");
    FormGroupe form = (FormGroupe)request.getAttribute("form");
%>

<form class="form-inline" action="ajouter" method="POST">
    <label for="nom">Nom : </label>
    <input id="nom" type="text" name="nom"  size="70" maxlength="70">
    <span style="color: blue;">${form.erreurs['nom']}</span>
    <br />
    </br>
    </br>
    <label for="dateCreation">Date de création : </label>
    <input id="dateCreation"  type="date"  name="dateCreation" size="10" maxlength="10">
    <span style="color: blue;">${form.erreurs['dateCreation']}</span>
    </br>
    
    </br>
    </br>
    <label for="telephone">Telephone : </label>
    <input id="telephone"  type="text"  name="telephone" size="10" maxlength="12">
    <span style="color: blue;">${form.erreurs['telephone']}</span>
    </br>
    
    </br>
    </br>
    <label for="siteWeb">Site Web : </label>
    <input id="siteWeb"  type="text"  name="siteWeb" size="70" maxlength="50">
    <span style="color: blue;">${form.erreurs['siteWeb']}</span>
    </br>
    
    </br>
    </br>
    <label for="mail">Mail : </label>
    <input id="mail"  type="text"  name="mail" size="70" maxlength="70">
    <span style="color: blue;">${form.erreurs['mail']}</span>
    </br>
    
    </br>
    </br>
    <%-- Champ Liste des genres --%>
    <label for="genre">Genre : </label>
    <select name="idGenre">
        <%
            ArrayList<Genre> lesGenres = (ArrayList)request.getAttribute("pLesGenres");
            for (int i=0; i<lesGenres.size();i++){
                Genre g = lesGenres.get(i);
                out.println("<option value='" + g.getId()+"'>" + g.getLibelle()+"</option>" );
            }
        %>
    </select>
    
    </br>
    </br>
    
    <label for="dispositif">Dispositif : </label>
    <select name="idDispositif">
        <%
            ArrayList<Dispositif> lesDispositifs = (ArrayList)request.getAttribute("pLesDispositifs");
            for (int i=0; i<lesDispositifs.size();i++){
                Dispositif d = lesDispositifs.get(i);
                out.println("<option value='" + d.getId()+"'>" + d.getLibelle()+"</option>" );
            }
        %>
    </select>
    </br>
    </br>
    <input class="btn btn-primary" type="submit" name="valider" id="valider" value="Valider"/>
    
    <a href="http://localhost:8080/normanzik/ServletGroupe/lister">
        <button type="button" class="btn btn-primary">Retour</button>
    </a>
</form>   
</div>
</body>
</html>