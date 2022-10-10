/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DaoAdmin.requete;
import static dao.DaoAdmin.rs;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Concert;
import model.Groupe;
import model.Lieu;

/**
 *
 * @author sio2
 */
public class DaoConcert {
    public static Concert ajouterConcert(Connection connection, Concert unConcert){
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // gpe_id (clé primaire de la table groupe) est en auto_increment,donc on ne renseigne pas cette valeur
            // le paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requete=connection.prepareStatement("INSERT INTO concert (con_date, con_idGroupe, con_idLieu)\n" +
                    "VALUES (?,?,?)", requete.RETURN_GENERATED_KEYS );
            requete.setString(1, unConcert.getDate());
            requete.setInt(2, unConcert.getLeGroupe().getId());
            requete.setInt(3, unConcert.getLeLieu().getId());

            System.out.println("requeteInsertion=" + requete);
            /* Exécution de la requête */
            int resultatRequete = requete.executeUpdate();
            System.out.println("resultatrequete=" + resultatRequete);

            // Récupération de id auto-généré par la bdd dans la table groupe
            rs = requete.getGeneratedKeys();
            while ( rs.next() ) {
                idGenere = rs.getInt( 1 );
                unConcert.setId(idGenere);
            }

            // si le résultat de la requete est différent de 1, c'est que la requête a échoué.
            // Dans ce cas, on remet l'objet groupe à null
            if (resultatRequete != 1){
                unConcert= null;
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
            unConcert= null;
        }
        return unConcert ;
    }

public static ArrayList<Concert> getLesConcerts(Connection connection){
        ArrayList<Concert> lesConcerts = new  ArrayList<Concert>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from concert, groupe, lieu where con_idGroupe=gpe_id and con_idLieu=lieu_id");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Dispositif et sa relation Genre avec les résultats de la requête
            while ( rs.next() ) {


                Concert leConcert = new Concert();
                leConcert.setId(rs.getInt("con_id"));
                leConcert.setDate(rs.getString("con_date"));
                
                Groupe leGroupe = new Groupe();
                leGroupe.setId(rs.getInt("gpe_id"));
                leGroupe.setNom(rs.getString("gpe_nom"));
                
                Lieu leLieu = new Lieu();
                leLieu.setId(rs.getInt("lieu_id"));
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