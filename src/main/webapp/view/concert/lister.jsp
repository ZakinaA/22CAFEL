<%-- 
    Document   : consulter
    Created on : 5 oct. 2022, 10:25:26
    Author     : sio2
--%>

<%@page import="model.Concert"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="../css/custom.css" rel="stylesheet">
</head>
<body>
<div class="container px-4 px-lg-5 custom-container">
<br/>


<%
    ArrayList<Concert> lesConcerts = (ArrayList)request.getAttribute("pLesConcerts");
%>

<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Les concerts :</b>
                    </div>
    <table  class="table table-curved table-normanzik">
        <thead>
        <tr>
            <th>Date</th>
            <th>Nom du groupe</th>
            <th>Ville</th>
            <th>Rue</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (Concert unConcert : lesConcerts) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println(unConcert.getDate());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println("&#128279 <a href ='../ServletGroupe/consulter?idGroupe=" + unConcert.getLeGroupe().getId() + "'>");
                    out.println(unConcert.getLeGroupe().getNom());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unConcert.getLeLieu().getVille());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unConcert.getLeLieu().getRue());
                    out.println("</td>");
                    
                }
            %>
        </tr>
    </tbody>
    </table>
</div>
</div>
        <%@include file="../pied.jsp"%>
</body>
</html>
