/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.DaoAdmin;
import dao.DaoUtilisateur;
import form.FormConnexion;
import form.FormUtilisateur;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Groupe;
import model.Statut;
import model.Instrument;
import model.Utilisateur;

/**
 *
 * @author sio2
 */
public class ServletConnexion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection connection ;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
     @Override
    public void init()
    {
        
        ServletContext servletContext=getServletContext();
        connection=(Connection)servletContext.getAttribute("connection");
        
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletUtilisateur</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletUtilisateur at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         // récupération de l url saisie dans le navigateur
        String url = request.getRequestURI();
        
        System.out.println("servlerconnexion url="+url);

        //Affichage de tous les membres (en indiquant le libellé du genre musical)
        /*if(url.equals("/normanzik/ServletMembre/lister")){
             System.out.println("servlermembre LISTER");
            ArrayList<Membre> lesMembres = DaoMembre.getLesMembres(connection);
            request.setAttribute("pLesMembres", lesMembres);
            this.getServletContext().getRequestDispatcher("/view/utilisateur/inscription.jsp" ).forward( request, response );
        }*/

        // Affichage du membre selectionné (depuis la fonctionnalité inscription)
        
        if(url.equals("/normanzik/ServletConnexion/connexion")){
            this.getServletContext().getRequestDispatcher("/view/utilisateur/connexion.jsp" ).forward( request, response );
        }
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       System.out.println("PASSE DO POSTE SERVLER UTIISATE");
        
        FormConnexion form = new FormConnexion();
        
        
        Utilisateur lUtilisateurSaisi = form.connexion(request);  
        
        
        request.setAttribute( "form", form );
        request.setAttribute( "pUtilisateur", lUtilisateurSaisi );
        
        if (form.getErreurs().isEmpty()){
            String identifiant = lUtilisateurSaisi.getIdentifiant();
            String mdp = lUtilisateurSaisi.getMdp();
            Utilisateur utilisateurCo = DaoUtilisateur.getLeUtilisateur(connection, identifiant, mdp);
            if(utilisateurCo.getIdentifiant() == null){
                this.getServletContext().getRequestDispatcher("/view/utilisateur/connexion.jsp" ).forward( request, response );
            }
            else{
                HttpSession session = request.getSession();

                session.setAttribute("identifiant", identifiant);
                session.setAttribute("role", utilisateurCo.getRoleUtilisateur().getId());
                session.setAttribute("membre", utilisateurCo.getMembre());
        
                this.getServletContext().getRequestDispatcher("/view/utilisateur/connexion.jsp").forward(request, response);
    
            }
        }
        else{
            this.getServletContext().getRequestDispatcher("/view/utilisateur/connexion.jsp" ).forward( request, response );
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    }
       
        
    



