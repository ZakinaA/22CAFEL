/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoAdmin;
import java.sql.Connection;
import model.Lieu;

/**
 *
 * @author sio2
 */
public class TestDaoAdmin {
    public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        Lieu lieu = new Lieu();
        lieu.setNomSalle("El Camino");
        lieu.setcPostale("14000");
        lieu.setVille("Caen");
        lieu.setRue("36 Rue de l'Église de Vaucelles");
   
        Lieu leLieuAInsere = DaoAdmin.ajouterLieu(con, lieu);
    }
}
