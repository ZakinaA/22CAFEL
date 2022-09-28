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
import model.Genre;
import model.Genre;

/**
 *
 * @author sio2
 */
public class DaoGenre {
        Connection connection=null;
        static PreparedStatement requete=null;
        static ResultSet rs=null;
    
    public static ArrayList<Genre> getLesGenres(Connection connection){
        ArrayList<Genre> lesGenres = new  ArrayList<Genre>();
        try
        {
            //preparation de la requete
            requete=connection.prepareStatement("select * from genre");
            System.out.println("Requete" + requete);

            //executer la requete
            rs=requete.executeQuery();

            //On hydrate l'objet métier Genre et sa relation Genre avec les résultats de la requête
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
}
