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
import model.Instrument;
import model.Membre;
import model.Statut;

/**
 *
 * @author sio2
 */
public class DaoMembre {
    Connection connection=null;
    static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    
    
    public static Membre getLeMembre(Connection connection, int idMembre){
        Membre leMembre = new Membre();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from membre, instrument, statut where mem_idInstru=instru_id AND mem_idStatut=stat_id AND mem_id=?");
            requete.setInt(1, idMembre);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Membre et sa relation Instrument avec les résultats de la requête
            if ( rs.next() ) {

                leMembre.setId(rs.getInt("mem_id"));
                leMembre.setNom(rs.getString("mem_nom"));
                leMembre.setPrenom(rs.getString("mem_prenom"));

                Instrument instru = new Instrument();
                
                Instrument lInstrument = new Instrument();
                instru.setId(rs.getInt("instru_id"));
                instru.setLibelle(rs.getString("instru_libelle"));
                
                Statut leStatut = new Statut();
                leStatut.setId(rs.getInt("stat_id"));
                leStatut.setLibelle(rs.getString("stat_libelle"));
                
                leMembre.setUnInstrument(instru);
                leMembre.setUnStatut(leStatut);

            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leMembre ;
    }
    
    
    
    
    
    public static ArrayList<Membre> getLesMembres(Connection connection){
        ArrayList<Membre> lesMembres = new  ArrayList<Membre>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from membre, instrument, statut where mem_idInstru=instru_id AND mem_idStatut=stat_id");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Membre et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {

                Membre leMembre = new Membre();
                leMembre.setId(rs.getInt("mem_id"));
                leMembre.setNom(rs.getString("mem_nom"));
                leMembre.setPrenom(rs.getString("mem_prenom"));

                Instrument lInstrument = new Instrument();
                lInstrument.setId(rs.getInt("instru_id"));
                lInstrument.setLibelle(rs.getString("instru_libelle"));
                
                Statut leStatut = new Statut();
                leStatut.setId(rs.getInt("stat_id"));
                leStatut.setLibelle(rs.getString("stat_libelle"));
                
                leMembre.setUnInstrument(lInstrument);
                leMembre.setUnStatut(leStatut);
                
                lesMembres.add(leMembre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesMembres ;
    }
    
    
    
    public static Membre ajouterMembre(Connection connection, Membre unMembre){
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO MEMBRE ( mem_nom, mem_prenom, mem_idStatut, mem_idInstru)\n" +
                    "VALUES (?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1,unMembre.getNom());
            requete.setString(2, unMembre.getPrenom());
            requete.setInt(3, unMembre.getUnStatut().getId());
            requete.setInt(4, unMembre.getUnInstrument().getId());

            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unMembre.setId(idGenere);
            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unMembre= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unMembre= null;
        }
        return unMembre ;
    }
    
    
    
    public static ArrayList<Membre> getLesMembresByGroupe(Connection connection, int idGroupe){
        ArrayList<Membre> lesMembres = new  ArrayList<Membre>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from membre M, membregroupe MG where MG.mem_id=M.mem_id and MG.gpe_id=?");
            requete.setInt(1, idGroupe);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Membre et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {

                Membre leMembre = new Membre();
                leMembre.setId(rs.getInt("mem_id"));
                leMembre.setNom(rs.getString("mem_nom"));
                leMembre.setPrenom(rs.getString("mem_prenom"));

                lesMembres.add(leMembre);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesMembres ;
    }
    
    
    public static Membre getLeMembreContactByGroupe(Connection connection, int idGroupe){
        Membre leMembre = new  Membre();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe left outer join membre on gpe_idMembreContact = mem_id where gpe_id=?");
            requete.setInt(1, idGroupe);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Membre et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {

                leMembre.setId(rs.getInt("mem_id"));
                leMembre.setNom(rs.getString("mem_nom"));
                leMembre.setPrenom(rs.getString("mem_prenom"));

            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leMembre ;
    }
    
    
}
