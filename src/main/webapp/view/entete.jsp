<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .header{
        background-color: rgba(255,255,255,0.9);
        margin-top: 0px;
        margin-left: -20px;
        margin-right: -10px;
}
    
    .imgen{
        position: relative;
        left: 96%;
        top: -35px;
        height: 25px;
        
    }
    
    .tn{
        text-align:center;
        color: #5e3f9c;
        font-size: 200%;
    }
    
    .entete{
        width:100%;
        margin-top: -40px;
    }
    .entete td{
        text-align : center;
    }
    
    .entete td a{
        color: #5e3f9c;
        text-decoration: none;
        font-size: 125%;
        margin-top: -20px;
    }
    
    .entete td a:hover{
        color: white;
        transition: 0.3s all;
    }
</style>
<body>
    <header class="header">
            <h1 class="tn">Norman'Zik</h1>
              
            <a href="#"><img class="imgen" href="#" src="../view/img/img_entete.png"></a> 
   
            
            
            <table class="entete">
                    <tr>
                        <td><a href="#">Concerts</a></td>
                        <td><a href="#">Festivals</a></td>
                        <td><a href="http://localhost:8080/normanzik/ServletGroupe/lister">Groupes</a></td>
                    </tr>
                </table>
            
 
    </header>