<%-- 
    Document   : consulter
    Created on : 5 oct. 2022, 10:25:26
    Author     : sio2
--%>

<%@page import="model.Festival"%>
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
    ArrayList<Festival> lesFestivals = (ArrayList)request.getAttribute("pLesFestivals");
%>

<div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Les festivals :</b>
                    </div>
    <table  class="table table-curved table-normanzik">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Lieu</th>
            <th>Début</th>
            <th>Fin</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (Festival unFestival : lesFestivals) {
                    out.println("<tr>");
                    out.println("<td>");
                    out.println(unFestival.getFest_nom());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unFestival.getFest_lieu());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unFestival.getFest_dateDebut());
                    out.println("</td>");
                    
                    out.println("<td>");
                    out.println(unFestival.getFest_dateFin());
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
