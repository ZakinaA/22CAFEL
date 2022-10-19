<%@page import="model.Membre"%>
<%@page import="model.Titre"%>
<%@page import="model.Groupe"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Dispositif"%>
<%@include file="../entete.jsp" %>
<!DOCTYPE html>
<html>
    <div class="container px-4 px-lg-5 custom-container">
<br/>

<div class="container">
  <div class="row">

<%
    Dispositif unDispositif = (Dispositif)request.getAttribute("pDispositif");
%>

<div class="col-sm">
                <div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Les groupes séléctionés :</b>
                    </div>
                    <table class="table bg-normanzik">
                        <thead>
                            <tr>
                            <th>Libellé</th>
                            <th>Genre</th>
                            <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
<%
out.println("<b>Libelle : </b>" + unDispositif.getLibelle() + "</br>");
out.println("<b>Année : </b>" + unDispositif.getAnnee() + "</br>");

out.println("<b>Les membres du groupe : </b>");
%>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        
                    <div class="col-sm">
                <div class="card bg-normanzik">
                    <div class="card-header">
                    <b>Les groupes séléctionés :</b>
                    </div>
                    <table class="table bg-normanzik">
                        <thead>
                            <tr>
                            <th>Nom</th>
                            <th>Genre</th>
                            <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <%
                            for (int i=0; i<unDispositif.getLesGroupes().size(); i++) {
                            Groupe unGroupe = unDispositif.getLesGroupes().get(i);
                            out.println("<tr><td>");
                            out.println(unGroupe.getNom());
                            out.println("</td>");
                    
                            out.println("<td>");
                            out.println(unGroupe.getGenre());
                            out.println("</a></td>");
                    
                    
                   
                    
                            
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