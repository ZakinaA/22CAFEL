<%@page import="model.Statut"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Membre"%>
<%@ page import="form.FormMembre" %>
<%@ page import="model.Instrument" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="../entete.jsp" %>
<html>
<h1>Ajouter Membre</h1>
<br/>


<%
    //Client client=(Client)request.getAttribute("client");
    FormMembre form = (FormMembre)request.getAttribute("form");
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
        <%
            ArrayList<Instrument> lesInstruments = (ArrayList)request.getAttribute("pLesInstruments");
            for (int i=0; i<lesInstruments.size();i++){
                Instrument instru = lesInstruments.get(i);
                out.println("<option value='" + instru.getId()+"'>" + instru.getLibelle()+"</option>" );
            }
        %>
    </select>
    
    </br>
    </br>
    
    <label for="statut">Statut : </label>
    <select name="idStatut">
        <%
            ArrayList<Statut> lesStatuts = (ArrayList)request.getAttribute("pLesStatuts");
            for (int i=0; i<lesStatuts.size();i++){
                Statut d = lesStatuts.get(i);
                out.println("<option value='" + d.getId()+"'>" + d.getLibelle()+"</option>" );
            }
        %>
    </select>
    </br>
    </br>
    <input type="submit" name="valider" id="valider" value="Valider"/>
</form>
    <%@include file="../pied.jsp"%>
</body>
</html>