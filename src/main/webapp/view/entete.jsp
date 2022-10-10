<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .header{
        background-color: rgba(255,255,255,0.75);
        margin-top: 0px;
        margin-left: -20px;
        margin-right: -10px;
}
    
    .imgen{
        position: relative;
        left: 96%;
        top: -45px;
        height: 30px;
        
    }
    
    .tn{
        text-align:center;
        color: #5e3f9c;
        font-size: 2%;
        text-decoration: none;
    }
    .tn:hover{
        color: white;
        transition: 0.8s all;
    }
    
    .entete{
        width:100%;
        margin-top: -35px;
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
<!DOCTYPE html>
<html>
<head>
    <title>WebZik</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="../css/custom.css" rel="stylesheet">
</head>
<body>
    <header class="header">
        <a class="tn" href="../index.html"><h1>Norman'Zik</h1></a>
              
            <a href="#"><img class="imgen" src="../img/img_entete.png"></a> 
   
            
            
            <table class="entete">
                    <tr>
                        <td><a href="http://localhost:8080/normanzik/ServletConcert/lister">Concerts</a></td>
                        <td><a href="#">Festivals</a></td>
                        <td><a href="http://localhost:8080/normanzik/ServletGroupe/lister">Groupes</a></td>
                    </tr>
                </table>
            
 
    </header>
    