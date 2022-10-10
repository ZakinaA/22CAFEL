/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DaoGroupe.requete;
import static dao.DaoGroupe.rs;
import static dao.DaoMembre.getLeMembreContactByGroupe;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Festival;
import test.ConnexionBdd;

/**
 *
 * @author sio2
 */
public class DaoFestival {


    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    
    
     public static ArrayList<Festival> getLesFestivals(Connection connection){
        ArrayList<Festival> lesFestivals = new  ArrayList<Festival>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from festival");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Festival leFestivale = new Festival();
                leFestivale.setFest_id(rs.getInt("fest_id"));
                leFestivale.setFest_nom(rs.getString("fest_nom"));
                leFestivale.setFest_dateDebut(rs.getString("fest_dateDebut"));
                leFestivale.setFest_dateFin(rs.getString("fest_dateFin"));
                leFestivale.setFest_lieu(rs.getString("fest_lieu"));


        
                
                
                
                lesFestivals.add(leFestivale);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesFestivals ;
    }
     
     /*public static Festival getLeFestival(Connection connection, int idUtilisateur){

        Festival leFestival = new Festival();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from festival where fest_id=?");
            requete.setInt(1, idUtilisateur);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {

                leFestival.setFest_id(rs.getInt("fest_id"));
                leFestival.setFest_nom(rs.getString("fest_nom"));
                leFestival.setFest_dateDebut(rs.getString("fest_dateDebut"));
                leFestival.setFest_dateFin(rs.getString("fest_dateFin"));
                leFestival.setFest_lieu(rs.getString("fest_lieu"));
                
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leFestival;
    }
*/
}
