/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoGenre;
import java.sql.Connection;
import java.util.ArrayList;
import model.Genre;

/**
 *
 * @author sio2
 */
public class TestDaoGenre {
    public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        ArrayList<Genre> lesGenres = DaoGenre.getLesGenres(con);
        for (int i=0; i<lesGenres.size(); i++){
            Genre genre = lesGenres.get(i);
            System.out.println(genre.getLibelle());
            }
    }
          
}
