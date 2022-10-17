/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DaoMembre.getLeMembreContactByGroupe;
import static dao.DaoMembre.getLesMembresByGroupe;
import static dao.DaoMembre.requete;
import static dao.DaoMembre.rs;
import static dao.DaoTitre.getLesTitresByGroupe;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Concert;
import model.Dispositif;
import model.Festival;
import model.Genre;
import model.Groupe;
import model.Instrument;
import model.Lieu;
import model.Membre;
import model.Statut;
import model.Titre;
import test.ConnexionBdd;

/**
 *
 * @author Zakina
 */
public class DaoGroupe {
    Connection connection=null;
     static PreparedStatement requete=null;
    static ResultSet rs=null;
    
    
    public static ArrayList<Groupe> getLesGroupes(Connection connection){
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, genre where gpe_idGenre = gre_id");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                leGroupe.setDateCreation(rs.getString("gpe_dateCreation"));
                leGroupe.setTelephone(rs.getString("gpe_telephone"));
                leGroupe.setMail(rs.getString("gpe_mel"));
                leGroupe.setSiteWeb(rs.getString("gpe_siteWeb"));
                leGroupe.setLieuRepetition(rs.getString("gpe_lieuRepetition"));
                leGroupe.setEstSelectionne(rs.getInt("gpe_estSelectionne"));

                Genre leGenre = new Genre();
                leGenre.setId(rs.getInt("gre_id"));
                leGenre.setLibelle(rs.getString("gre_libelle"));

                leGroupe.setGenre(leGenre);
                //on veut le membre contact du groupe
                Membre leMembreContact = getLeMembreContactByGroupe(connection, leGroupe.getId());
                
                leGroupe.setLeMembreContact(leMembreContact);
                
                lesGroupes.add(leGroupe);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGroupes ;
    }


    public static Groupe getLeGroupe(Connection connection, int idGroupe){

        Groupe leGroupe = new Groupe();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, genre where gpe_idGenre = gre_id and gpe_id=?");
            requete.setInt(1, idGroupe);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            if ( rs.next() ) {

                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                leGroupe.setDateCreation(rs.getString("gpe_dateCreation"));
                leGroupe.setTelephone(rs.getString("gpe_telephone"));
                leGroupe.setMail(rs.getString("gpe_mel"));
                leGroupe.setSiteWeb(rs.getString("gpe_siteWeb"));
                leGroupe.setLieuRepetition(rs.getString("gpe_lieuRepetition"));
                leGroupe.setEstSelectionne(rs.getInt("gpe_estSelectionne"));

                Genre leGenre = new Genre();
                leGenre.setId(rs.getInt("gre_id"));
                leGenre.setLibelle(rs.getString("gre_libelle"));
                
                
                ArrayList<Titre> lesTitres = getLesTitresByGroupe(connection, idGroupe);
              
                
                //on veut les membres du groupe
                ArrayList<Membre> lesMembres = getLesMembresByGroupe(connection, idGroupe);
                
                
                //on veut le membre contact du groupe
                Membre leMembreContact = getLeMembreContactByGroupe(connection, idGroupe);
                
                leGroupe.setLesTitres(lesTitres);
                leGroupe.setLesMembres(lesMembres);
                leGroupe.setLeMembreContact(leMembreContact);
                
                leGroupe.setGenre(leGenre);

            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return leGroupe ;
    }

    public static Groupe ajouterGroupe(Connection connection, Groupe unGroupe){
        int idGenere = -1;
        try
        {  
            System.out.println("AJOUTER GROUPE DAO GROUPE");
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO GROUPE ( gpe_nom, gpe_dateCreation, gpe_telephone, gpe_mel, gpe_siteWeb, gpe_idDispositif, gpe_idGenre)\n" +
                    "VALUES (?,?,?,?,?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unGroupe.getNom());
            requete.setString(2, unGroupe.getDateCreation());
            requete.setString(3, unGroupe.getTelephone());
            requete.setString(4, unGroupe.getMail());
            requete.setString(5, unGroupe.getSiteWeb());
            requete.setInt(6, unGroupe.getDispositif().getId());
            requete.setInt(7, unGroupe.getGenre().getId());

            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unGroupe.setId(idGenere);
            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unGroupe= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unGroupe= null;
        }
        return unGroupe ;
    }
    
    
    public static ArrayList<Groupe> getLesGroupesByDispositif(Connection connection, int idDispositif){
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, dispositif where gpe_idDispositif = dis_id and dis_id=?");
            requete.setInt(1, idDispositif);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                leGroupe.setDateCreation(rs.getString("gpe_dateCreation"));

                Dispositif leDispositif = new Dispositif();
                leDispositif.setId(rs.getInt("dis_id"));
                leDispositif.setLibelle(rs.getString("dis_libelle"));

                leGroupe.setDispositif(leDispositif);
                lesGroupes.add(leGroupe);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGroupes ;
    }
    
    
    
    
    public static ArrayList<Groupe> getLesGroupesByMembre(Connection connection, int idMembre){
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe G, membre M, membregroupe MG where MG.gpe_id = G.gpe_id and MG.mem_id=M.mem_id and M.mem_id=?");
            requete.setInt(1, idMembre);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                leGroupe.setDateCreation(rs.getString("gpe_dateCreation"));

                lesGroupes.add(leGroupe);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGroupes ;
    }
    
    
    
    
    
    
    public static ArrayList<Groupe> getLesGroupesByGenre(Connection connection, int idGenre){
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe, genre where gpe_idGenre = gre_id and gre_id=?");
            requete.setInt(1, idGenre);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                leGroupe.setDateCreation(rs.getString("gpe_dateCreation"));

                lesGroupes.add(leGroupe);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGroupes ;
    }
    
    
    public static ArrayList<Groupe> getLesGroupesByFestival(Connection connection, int fest_id){
        ArrayList<Groupe> lesGroupes = new  ArrayList<Groupe>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe G, festival F, festivalgroupe FG where FG.gpe_id = G.gpe_id and FG.fest_id=F.fest_id and F.fest_id=?");
            requete.setInt(1, fest_id);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Groupe et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                leGroupe.setDateCreation(rs.getString("gpe_dateCreation"));
                
                Festival leFestival = new Festival();
                leFestival.setFest_id(rs.getInt("fest_id"));
                leFestival.setFest_nom(rs.getString("fest_nom"));
                leFestival.setFest_dateDebut(rs.getString("fest_dateDebut"));
                leFestival.setFest_dateFin(rs.getString("fest_dateFin"));
                
                leGroupe.setFestival(leFestival);
                
                lesGroupes.add(leGroupe);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesGroupes ;
    }
    
    public static ArrayList<Concert> getLesConcertsByGroupe(Connection connection, int idGroupe){
        ArrayList<Concert> lesConcerts = new  ArrayList<Concert>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from groupe G, concert C, lieu L where G.gpe_id=C.con_idGroupe AND L.lieu_id=C.con_idLieu and G.gpe_id=?");
            requete.setInt(1, idGroupe);
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Concert et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {

                Concert leConcert = new Concert();
                leConcert.setId(rs.getInt("con_id"));
                leConcert.setDate(rs.getString("con_date"));
                
                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                
                Lieu leLieu = new Lieu();
                leLieu.setId(rs.getInt("lieu_id"));
                leLieu.setNomSalle(rs.getString("lieu_nomSalle"));
                leLieu.setRue(rs.getString("lieu_rue"));
                leLieu.setcPostale(rs.getString("lieu_cPostale"));
                leLieu.setVille(rs.getString("lieu_ville"));
                
                leConcert.setLeGroupe(leGroupe);
                leConcert.setLeLieu(leLieu);
                
                lesConcerts.add(leConcert);

            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return lesConcerts ;
    }
}
