<%@page import="model.Dispositif"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Groupe"%>
<%@ page import="form.FormGroupe" %>
<%@ page import="model.Genre" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="../entete.jsp"%>
<html>
<div class="container px-4 px-lg-5">
<br/>


<%
    //Client client=(Client)request.getAttribute("client");
    FormGroupe form = (FormGroupe)request.getAttribute("form");
%>
<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Ajouter groupe :</b>
                    </div>
<form class="form-inline" action="ajouter" method="POST">
    <ul class="list-group list-group-flush">
    <li class="list-group-item">Nom :
    <input id="nom" type="text" name="nom"  size="70" maxlength="70">
    <span style="color: blue;">${form.erreurs['nom']}</span></li>
    
    <li class="list-group-item"> Date de création : 
    <input id="dateCreation"  type="date"  name="dateCreation" size="10" maxlength="10">
    <span style="color: blue;">${form.erreurs['dateCreation']}</span>        
    </li>
    
    <li class="list-group-item">Telephone :
    <input id="telephone"  type="text"  name="telephone" size="10" maxlength="12">
    <span style="color: blue;">${form.erreurs['telephone']}</span>
    </li>
    
    <li class="list-group-item"> Site Web :
    <input id="siteWeb"  type="text"  name="siteWeb" size="70" maxlength="50">
    <span style="color: blue;">${form.erreurs['siteWeb']}</span>
    </li>
    
    <li class="list-group-item"> Mail :
    <input id="mail"  type="text"  name="mail" size="70" maxlength="70">
    <span style="color: blue;">${form.erreurs['mail']}</span>
    </li>
    
    <li class="list-group-item"> Genre : 
    <select name="idGenre">
        <%
            ArrayList<Genre> lesGenres = (ArrayList)request.getAttribute("pLesGenres");
            for (int i=0; i<lesGenres.size();i++){
                Genre g = lesGenres.get(i);
                out.println("<option value='" + g.getId()+"'>" + g.getLibelle()+"</option>" );
            }
        %>
    </select>    
    </li>
    
    <li class="list-group-item"> Dispositif :
    <select name="idDispositif">
        <%
            ArrayList<Dispositif> lesDispositifs = (ArrayList)request.getAttribute("pLesDispositifs");
            for (int i=0; i<lesDispositifs.size();i++){
                Dispositif d = lesDispositifs.get(i);
                out.println("<option value='" + d.getId()+"'>" + d.getLibelle()+"</option>" );
            }
        %>
    </select>
    </li>
    </ul> 
</form>   
</div>
    
    <br>
    <input class="btn btn-normanzik" type="submit" name="valider" id="valider" value="Valider"/>
    
    <a href="http://localhost:8080/normanzik/ServletGroupe/lister">
        <button type="button" class="btn btn-normanzik">Retour</button>
    </a>
</div>
    <%@include file="../pied.jsp"%>
</body>
</html>