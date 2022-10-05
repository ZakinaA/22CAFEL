<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Dispositif"%>
<%@ page import="java.util.ArrayList" %>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<div class="container px-4 px-lg-5">
<h1>Lister Dispositif</h1>
<br/>


<%
    ArrayList<Dispositif> lesDispositifs = (ArrayList)request.getAttribute("pLesDispositifs");
%>

    <table  class="table table-bordered table-striped table-condensed">
        <thead>
        <tr>
            <th>Id</th>
            <th>Libell</th>

        </tr>
        </thead>
        <tbody>
        <tr>
            <%
                for (Dispositif unDispositif : lesDispositifs) {
                    out.println("<tr><td>");
                    out.println(unDispositif.getId());
                    out.println("</td>");

                    out.println("<td>");
                    out.println("<a href ='../ServletDispositif/consulter?idDispositif=" + unDispositif.getId() + "'>");
                    out.println(unDispositif.getLibelle());
                    out.println("</a></td>");

                    
                }
            %>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>