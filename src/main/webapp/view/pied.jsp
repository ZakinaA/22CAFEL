<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .footer{
        background-color: rgba(255,255,255,0.75);  
        position:fixed;
        bottom: 0;
        width:100%;
    }
    .pied{
       width:100%;
       
    }
    .pied td a{
        color: #5e3f9c;
        text-align: center;
        text-decoration: none;
    }
    
    .pied td a:hover{
        color: white;
        transition: 0.3s all;
    }
</style>


<footer class="footer">
     <table class="pied">
                    <tr>
                        <td><a href="<%out.print(getServletContext().getContextPath());%>/ServletRedirection/mentions">Mentions Légales</a></td>
                        <td><a href="<%out.print(getServletContext().getContextPath());%>/ServletRedirection/politique">Politique de Confidentialité</a></td>
                        <td><a href="#">Copyright 2022</a></td>
                        <td><a href="#">A Propos</a></td>
                        <td><a href="#">Contact</a></td>

                    </tr>
                </table>
</footer>

    </body>
</html>
