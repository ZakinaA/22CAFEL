/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import dao.DaoRoleUtilisateur;
import dao.DaoUtilisateur;
import java.sql.Connection;
import model.RoleUtilisateur;
import model.Utilisateur;

/**
 *
 * @author sio2
 */
public class TestDaoUtilisateur {
     public static void main(String[] args) {
        Connection con = ConnexionBdd.ouvrirConnexion();
        
        String identifiant = "NicoZANGA";
        String mdp = "fdbwgt";
        
        Utilisateur unUtilisateur = DaoUtilisateur.getLeUtilisateur(con, identifiant, mdp);
        System.out.println("id :" + unUtilisateur.getIdentifiant() + "  role : " + unUtilisateur.getRoleUtilisateur().getId() + " membre : " + unUtilisateur.getMembre().getId());
        
        /*
        ArrayList<Utilisateur> lesUtilisateurs = getLesUtilisateurs(con);
        for (int i=0; i<lesUtilisateurs.size(); i++){
            Utilisateur utilisateur = lesUtilisateurs.get(i);
            System.out.println("nom du membre : " + membre.getNom() + ". Instrument principal du membre : " + membre.getUnInstrument().getLibelle()
                + " Statut du membre : " + membre.getUnStatut().getLibelle());
            
        }
        */
        
        /* Utilisateur uti = new Utilisateur();
        uti.setUti_identifiant("usertest");
        uti.setUti_mdp("password");
        uti.setUti_idRole(4);
        
        Utilisateur leUtilisateurAInsere = DaoUtilisateur.ajouterUtilisateur(con, uti);*/
               
        ConnexionBdd.fermerConnexion(con);
        
        
        
    }
}
