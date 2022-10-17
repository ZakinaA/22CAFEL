/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.RoleUtilisateur;



/**
 *
 * @author sio2
 */
public class DaoRoleUtilisateur {
        Connection connection=null;
        static PreparedStatement requete=null;
        static ResultSet rs=null;
    
    public static RoleUtilisateur getLeRoleUtilisateur(Connection connection, Integer idRoleUtilisateur){

        RoleUtilisateur leRoleUtilisateur = new RoleUtilisateur();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from RoleUtilisateur where roluti_id=?");
            requete.setInt(1, idRoleUtilisateur);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {

                leRoleUtilisateur.setId(rs.getInt("roluti_id"));
                leRoleUtilisateur.setLibelle(rs.getString("roluti_libelle"));
                
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leRoleUtilisateur ;
    }
    
}
