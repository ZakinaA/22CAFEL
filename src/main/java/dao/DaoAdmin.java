/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DaoDispositif.requete;
import static dao.DaoDispositif.rs;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Dispositif;
import model.Genre;
import model.Instrument;
import model.Lieu;
import model.Lieu;
import model.Statut;

/**
 *
 * @author Zakina
 */
public class DaoAdmin {

    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;

    public static ArrayList<Genre> getLesGenres(Connection connection){
        ArrayList<Genre> lesGenres = new  ArrayList<Genre>();
        try
        {
            requete=connection.prepareStatement("select * from  genre ");
            rs=requete.executeQuery();
            while ( rs.next() ) {

                Genre leGenre = new Genre();
                leGenre.setId(rs.getInt("gre_id"));
                leGenre.setLibelle(rs.getString("gre_libelle"));
                lesGenres.add(leGenre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGenres ;
    }
    
    public static Lieu ajouterLieu(Connection connection, Lieu unLieu){
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO lieu (lieu_nomSalle, lieu_cPostale, lieu_ville, lieu_rue)\n" +
                    "VALUES (?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unLieu.getNomSalle());
            requete.setString(2, unLieu.getcPostale());
            requete.setString(3, unLieu.getVille());
            requete.setString(4, unLieu.getRue());

            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unLieu.setId(idGenere);
            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unLieu= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unLieu= null;
        }
        return unLieu ;
    }
    
    public static ArrayList<Dispositif> getLesDispositifs(Connection connection){
        ArrayList<Dispositif> lesDispositifs = new  ArrayList<Dispositif>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from dispositif");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Dispositif et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Dispositif leDispositif = new Dispositif();
                leDispositif.setId(rs.getInt("dis_id"));
                leDispositif.setLibelle(rs.getString("dis_libelle"));

                lesDispositifs.add(leDispositif);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesDispositifs ;
    }
    
    
    public static ArrayList<Statut> getLesStatuts(Connection connection){
        ArrayList<Statut> lesStatuts = new  ArrayList<Statut>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from statut");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Statut et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Statut leStatut = new Statut();
                leStatut.setId(rs.getInt("stat_id"));
                leStatut.setLibelle(rs.getString("stat_libelle"));

                lesStatuts.add(leStatut);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesStatuts ;
    }
    
    
    public static ArrayList<Instrument> getLesInstruments(Connection connection){
        ArrayList<Instrument> lesInstruments = new  ArrayList<Instrument>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from instrument");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Instrument et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Instrument leInstrument = new Instrument();
                leInstrument.setId(rs.getInt("instru_id"));
                leInstrument.setLibelle(rs.getString("instru_libelle"));

                lesInstruments.add(leInstrument);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesInstruments ;
    }
}
