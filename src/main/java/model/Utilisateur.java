/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class Utilisateur {
    private int uti_identifiant ;
    private String uti_mdp ;
    private RoleUtilisateur roluti_id ;

    public Utilisateur() {
    }

    public Utilisateur(int uti_identifiant, String uti_mdp, RoleUtilisateur roluti_id) {
        this.uti_identifiant = uti_identifiant;
        this.uti_mdp = uti_mdp;
        this.roluti_id = roluti_id;
    }

    public int getUti_identifiant() {
        return uti_identifiant;
    }

    public String getUti_mdp() {
        return uti_mdp;
    }

    public RoleUtilisateur getRoluti_id() {
        return roluti_id;
    }

    public void setUti_identifiant(int uti_identifiant) {
        this.uti_identifiant = uti_identifiant;
    }

    public void setUti_mdp(String uti_mdp) {
        this.uti_mdp = uti_mdp;
    }

    public void setRoluti_id(RoleUtilisateur roluti_id) {
        this.roluti_id = roluti_id;
    }

    
}
