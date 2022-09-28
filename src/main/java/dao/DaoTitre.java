/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DaoTitre.requete;
import static dao.DaoTitre.rs;
import static dao.DaoGroupe.rs;
import static dao.DaoTitre.requete;
import static dao.DaoTitre.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Titre;
import model.Groupe;
import model.Titre;
import model.Titre;

/**
 *
 * @author sio2
 */
public class DaoTitre {
    
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    
    public static ArrayList<Titre> getLesTitresByGroupe(Connection connection, int idGroupe){
        ArrayList<Titre> lesTitres = new  ArrayList<Titre>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, titre where gpe_id = tit_idGpe and gpe_id=?");
            requete.setInt(1, idGroupe);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Titre et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Titre leTitre = new Titre();
                leTitre.setNumero(rs.getInt("tit_numero"));
                leTitre.setIntitule(rs.getString("tit_intitule"));
                leTitre.setLienURL(rs.getString("tit_lienURL"));

                lesTitres.add(leTitre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesTitres ;
    }
    
    
    
    public static Groupe getLeGroupeByTitre(Connection connection, int idTitre){
        Groupe leGroupe = new  Groupe();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, titre where gpe_id = tit_idGpe and tit_id=?");
            requete.setInt(1, idTitre);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Titre et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {

                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                leGroupe.setDateCreation(rs.getString("gpe_dateCreation"));

            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leGroupe ;
    }
    
    
    
    public static Titre ajouterTitre(Connection connection, Titre unTitre){
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO TITRE ( tit_idGpe, tit_numero, tit_intitule, tit_duree, tit_lienURL)\n" +
                    "VALUES (?,?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setInt(1, unTitre.getLeGroupe().getId());
            requete.setInt(2, unTitre.getNumero());
            requete.setString(3, unTitre.getIntitule());
            requete.setString(4, unTitre.getDuree());
            requete.setString(5, unTitre.getLienURL());

            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);


            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unTitre= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unTitre= null;
        }
        return unTitre ;
    }
}
