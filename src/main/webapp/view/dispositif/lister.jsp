<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Dispositif"%>
<%@ page import="java.util.ArrayList" %>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>

<div class="container px-4 px-lg-5 custom-container">
<br/>

<%
    ArrayList<Dispositif> lesDispositifs = (ArrayList)request.getAttribute("pLesDispositifs");
%>

    <div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Les groupes :</b>
                    </div>
    <table  class="table table-curved table-normanzik">
        <thead>
        <tr>
            <th>Id</th>
            <th>Libellé</th>

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