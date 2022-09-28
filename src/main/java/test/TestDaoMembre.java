/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoGroupe;
import dao.DaoMembre;
import static dao.DaoMembre.getLesMembres;
import java.sql.Connection;
import java.util.ArrayList;
import model.Genre;
import model.Groupe;
import model.Membre;
import model.Statut;

/**
 *
 * @author sio2
 */
public class TestDaoMembre {
     public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        Membre leMembre = DaoMembre.getLeMembre(con, 1);
        System.out.println("Membre de l'id 1 " + leMembre.getNom() + ". Instrument du membre : " + leMembre.getUnInstrument().getLibelle()
                + " Statut du membre : " + leMembre.getUnStatut().getLibelle());
        
        /*
        ArrayList<Membre> lesMembres = getLesMembres(con);
        for (int i=0; i<lesMembres.size(); i++){
            Membre membre = lesMembres.get(i);
            System.out.println("nom du membre : " + membre.getNom() + ". Instrument principal du membre : " + membre.getUnInstrument().getLibelle()
                + " Statut du membre : " + membre.getUnStatut().getLibelle());
            
        }
        */
        
        /*Membre mem = new Membre();
        mem.setNom("HERMAN");
        mem.setPrenom("Benjamin");
        
        Statut stat = new Statut();
        stat.setId(1);
        
        mem.setUnStatut(stat);
        
        Membre leMembreAInsere = DaoMembre.ajouterMembre(con, mem);*/
        
        
        
        ConnexionBdd.fermerConnexion(con);
    }
}
