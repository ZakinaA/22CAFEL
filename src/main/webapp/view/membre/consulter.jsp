<%-- 
    Document   : consulter
    Created on : 21 sept. 2022, 11:17:02
    Author     : sio2
--%>

<%@page import="model.JouerGroupe"%>
<%@page import="model.Groupe"%>
<%@page import="model.Membre"%>
<%@include file="../entete.jsp" %>
<html>
    <%
        Membre leMembre = (Membre)request.getAttribute("pMembre");
    %>
<div class="container px-4 px-lg-5 custom-container">
    <br/>

    <div class="container">
        <div class="row">
            <div class="col-sm">
               <div class="card bg-normanzik">
                    <div class="card-header">
                        <b>Informations membre :</b>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><% out.println("<b>Nom : </b>" + leMembre.getNom() + "</br>");%></li>
                        <li class="list-group-item"><% out.println("<b>Prénom : </b>" + leMembre.getPrenom() + "</br>");%></li>
                        <li class="list-group-item"><% out.println("<b>Instrument principal : </b>" + leMembre.getUnInstrument().getLibelle() + "</br>");%></li>
                    </ul>
                </div>
            </div>
                    
            <div class="col-sm">
               <div class="card bg-normanzik">
                    <div class="card-header">
                        <b>Groupes du membre :</b>
                    </div>
                    <table class="table bg-normanzik">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Instrument joué</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            for (int i=0; i<leMembre.getLesGroupes().size(); i++) {
                            JouerGroupe unGroupe = leMembre.getLesGroupes().get(i);
                            out.println("<tr>");
                    
                            out.println("<td>");
                            out.println("&#128279 <a href ='../ServletGroupe/consulter?idGroupe=" + unGroupe.getLeGroupe().getId() + "'>");
                            out.println(unGroupe.getLeGroupe().getNom());
                            out.println("</a></td>");
                            
                            out.println("<td>");
                            out.println(unGroupe.getlInstrument().getLibelle());
                            out.println("</a></td>");
                            
                            out.println("</tr>");
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
                    
        </div>
    </div>

    <br>
    <input class="btn btn-normanzik" type="button" value="Retour" onclick="history.back()">
</div>
                <%@include file="../pied.jsp"%>
</body>
</html>
