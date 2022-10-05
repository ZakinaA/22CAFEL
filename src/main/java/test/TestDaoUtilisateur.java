/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoUtilisateur;
import java.sql.Connection;
import model.Utilisateur;

/**
 *
 * @author sio2
 */
public class TestDaoUtilisateur {
     public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        Utilisateur lUtilisateur = DaoUtilisateur.getLutilisateur(con, 1);
        System.out.println("Utilisateur de l'id 1 " + lUtilisateur.getUti_identifiant() + ". Mot de passe de l'utilisateur : " + lUtilisateur.getUti_mdp());
        
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
