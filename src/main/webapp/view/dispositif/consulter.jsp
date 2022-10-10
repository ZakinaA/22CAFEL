<%@page import="model.Titre"%>
<%@page import="model.Groupe"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Dispositif"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
</head>
<body>
<h1>Consulter Dispositif</h1>
<br/>

<%
    Dispositif unDispositif = (Dispositif)request.getAttribute("pDispositif");
%>
<%
out.println("<b>Libelle : </b>" + unDispositif.getLibelle() + "</br>");
out.println("<b>Année : </b>" + unDispositif.getAnnee() + "</br>");

out.println("<b>Les membres du groupe : </b>");
%>

<table>
        <thead>
        <tr>
            <th>Id</th>
            <th>Nom</th>
            <th>Selectionné</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (int i=0; i<unDispositif.getLesGroupes().size(); i++) {
                    Groupe unGroupe = unDispositif.getLesGroupes().get(i);
                    out.println("<tr><td>");
                    out.println(unGroupe.getId());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println("<a href ='../ServletGroupe/consulter?idGroupe=" + unGroupe.getId() + "'>");
                    out.println(unGroupe.getNom());
                    out.println("</a></td>");
                    
                    out.println("<td>");
                    if (unGroupe.getEstSelectionne()==1){
                        out.println("<a href='../'>");
                    }
                    out.println("</a></td>");
                    
                }
            %>
        </tr>
        </tbody>
    </table>
    
        

<%@include file="../pied.jsp"%>
</body>
</html>