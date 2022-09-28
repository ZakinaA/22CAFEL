/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoAdmin;
import dao.DaoConcert;
import java.sql.Connection;
import model.Concert;
import model.Groupe;
import model.Lieu;

/**
 *
 * @author sio2
 */
public class TestDaoConcert {
    public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        
        Concert concert = new Concert();
        concert.setDate("2022-12-01");
        
        Groupe gp = new Groupe();
        gp.setId(2);
        
        concert.setLeGroupe(gp);
        
        Lieu leLieu = new Lieu();
        leLieu.setId(7);
        concert.setLeLieu(leLieu);
   
        Concert leConcertAInsere = DaoConcert.ajouterConcert(con, concert);
    }
}
