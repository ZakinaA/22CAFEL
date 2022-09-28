/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoGroupe;
import static dao.DaoGroupe.getLesConcertsByGroupe;
import static dao.DaoGroupe.getLesGroupesByGenre;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Concert;
import model.Genre;
import model.Groupe;
import model.Membre;
import model.Titre;
import static sun.jvm.hotspot.runtime.BasicObjectLock.size;

/**
 *
 * @author Zakina
 */
public class TestDaoGroupe {
    
    public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        
        /*Groupe leGroupe = DaoGroupe.getLeGroupe(con, 1);
        System.out.println(leGroupe.getNom() + ". Concerts du groupe : ");
        
        ArrayList<Concert> lesConcerts = DaoGroupe.getLesConcertsByGroupe(con, 1);
        for (int i=0; i<lesConcerts.size(); i++){
            Concert leConcert = lesConcerts.get(i);
            System.out.println(leConcert.getDate() + " à " + leConcert.getLeLieu().getNomSalle()); 
        }*/
        
        Groupe leGroupe = DaoGroupe.getLeGroupe(con, 1);
        System.out.println(leGroupe.getNom() + ". Membre contact du groupe: " + leGroupe.getLeMembreContact().getNom() + ". Titres du groupe : ");
        
        for (int i=0; i<leGroupe.getLesTitres().size(); i++){
            Titre unTitre = leGroupe.getLesTitres().get(i);
            System.out.println(unTitre.getIntitule()); 
        }
        
        /*System.out.println("Membres du groupe : ");
                
        for (int i=0; i<leGroupe.getLesMembres().size(); i++){
            Membre unMembre = leGroupe.getLesMembres().get(i);
            System.out.println(unMembre.getNom()); 
        }
        
        
        System.out.println("Groupes du genre 2 (POP) :");
        for (int i=0; i<getLesGroupesByGenre(con, 2).size(); i++){
            Groupe unGroupe = getLesGroupesByGenre(con, 2).get(i);
            System.out.println(unGroupe.getNom()); 
        }
        
        */ArrayList<Groupe> lesGroupes = DaoGroupe.getLesGroupes(con);
        for (int i=0; i<lesGroupes.size(); i++){
            Groupe grp = lesGroupes.get(i);
            System.out.println("nom du groupe : " + grp.getNom() + " membre contact du groupe " + grp.getLeMembreContact().getNom());
 
            
        }
        
        /*
        ArrayList<Groupe> lesGroupesDisp2 = DaoGroupe.getLesGroupesByDispositif(con, 2);
        for (int i=0; i<lesGroupesDisp2.size(); i++){
            Groupe grp2 = lesGroupesDisp2.get(i);
            System.out.println("nom du groupe : " + grp2.getNom() + " genre du groupe " + grp2.getDispositif().getLibelle());
        }
        
        Groupe gp = new Groupe();
        gp.setNom("Les flashs");
        gp.setDateCreation("2021-05-03");
        
        Genre gr = new Genre();
        gr.setId(1);
        
        gp.setGenre(gr);
        
        Groupe leGroupeAInsere = DaoGroupe.ajouterGroupe(con, gp);*/
        
        
        
        
        ConnexionBdd.fermerConnexion(con);
    }
    
}
