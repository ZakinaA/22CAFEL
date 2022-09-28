/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoAdmin;
import dao.DaoDispositif;
import dao.DaoDispositif;
import java.sql.Connection;
import java.util.ArrayList;
import model.Dispositif;
import model.Genre;
import model.Dispositif;

/**
 *
 * @author sio2
 */
public class TestDaoDispositif {
     public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        ArrayList<Dispositif> lesDispositifs = DaoAdmin.getLesDispositifs(con);
        for (int i=0; i<lesDispositifs.size(); i++){
            Dispositif grp = lesDispositifs.get(i);
            System.out.println("libelle du dispositif : " + grp.getLibelle());
        }
        
        /*Dispositif dis = new Dispositif();
        dis.setAnnee(2024);
        dis.setLibelle("NorZik24");
        
        
        Dispositif leDispositifAInsere = DaoDispositif.ajouterDispositif(con, dis);*/
        
}
}
