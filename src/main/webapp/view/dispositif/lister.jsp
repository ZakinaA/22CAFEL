<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Dispositif"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
</head>
<body>
<h1>Lister Dispositif</h1>
<br/>


<%
    ArrayList<Dispositif> lesDispositifs = (ArrayList)request.getAttribute("pLesDispositifs");
%>


<div class="container px-4 px-lg-5">
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