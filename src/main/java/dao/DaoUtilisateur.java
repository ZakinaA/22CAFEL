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
import model.Membre;
import model.RoleUtilisateur;
import model.Utilisateur;


/**
 *
 * @author sio2
 */
public class DaoUtilisateur {
        Connection connection=null;
        static PreparedStatement requete=null;
        static ResultSet rs=null;
    
    public static ArrayList<Utilisateur> getLesUtilisateurs(Connection connection){
        ArrayList<Utilisateur> lesUtilisateurs = new  ArrayList<Utilisateur>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from utilisateur");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Genre et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {
                
                Utilisateur leUtilisateur = new Utilisateur();
                leUtilisateur.setIdentifiant(rs.getString("uti_identifiant"));
                leUtilisateur.setMdp(rs.getString("uti_mdp"));

                lesUtilisateurs.add(leUtilisateur);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesUtilisateurs ;
    }
    
    public static Utilisateur getLeUtilisateur(Connection connection, String identifiant, String mdp){

        Utilisateur leUtilisateur = new Utilisateur();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from utilisateur U LEFT JOIN roleutilisateur R ON U.uti_idRole=R.roluti_id LEFT JOIN membre M ON M.mem_idUtilisateur=U.uti_identifiant where uti_identifiant=? and uti_mdp=?");
            requete.setString(1, identifiant);
            requete.setString(2, mdp);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {

                leUtilisateur.setIdentifiant(rs.getString("uti_identifiant"));
                leUtilisateur.setMdp(rs.getString("uti_mdp"));
                
                Membre leMembre = new Membre();
                leMembre.setId(rs.getInt("mem_id"));
                
                RoleUtilisateur leRole = new RoleUtilisateur();
                leRole.setId(rs.getInt("uti_idRole"));
                
                leUtilisateur.setMembre(leMembre);
                leUtilisateur.setRoleUtilisateur(leRole);
            }
            
            else {
                leUtilisateur.setIdentifiant(null);
                leUtilisateur.setMdp(null);
                
                Membre leMembre = new Membre();
                
                RoleUtilisateur leRole = new RoleUtilisateur();
                
                leUtilisateur.setMembre(leMembre);
                leUtilisateur.setRoleUtilisateur(leRole);
                
            }
            
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leUtilisateur;
    }
    
    public static Utilisateur ajouterUtilisateur(Connection connection, Utilisateur unUtilisateur){
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO UTILISATEUR ( uti_identifiant, uti_mdp, uti_idRole)\n" +
                    "VALUES (?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unUtilisateur.getIdentifiant());
            requete.setString(2, unUtilisateur.getMdp());
            requete.setInt(3, unUtilisateur.getRoleUtilisateur().getId());

            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unUtilisateur= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unUtilisateur= null;
        }
        return unUtilisateur ;
    }
    
}
