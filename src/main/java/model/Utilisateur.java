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
    private String uti_identifiant ;
    private String uti_mdp ;
    private int Uti_idRole ;
    private RoleUtilisateur roleUtilisateur ;

    public Utilisateur() {
    }

    public Utilisateur(String uti_identifiant, String uti_mdp, int Uti_idRole, RoleUtilisateur roleUtilisateur) {
        this.uti_identifiant = uti_identifiant;
        this.uti_mdp = uti_mdp;
        this.Uti_idRole = Uti_idRole;
        this.roleUtilisateur = roleUtilisateur;
    }

    public String getUti_identifiant() {
        return uti_identifiant;
    }

    public String getUti_mdp() {
        return uti_mdp;
    }

    public int getUti_idRole() {
        return Uti_idRole;
    }

    public RoleUtilisateur getRoleUtilisateur() {
        return roleUtilisateur;
    }

    public void setUti_identifiant(String uti_identifiant) {
        this.uti_identifiant = uti_identifiant;
    }

    public void setUti_mdp(String uti_mdp) {
        this.uti_mdp = uti_mdp;
    }

    public void setUti_idRole(int Uti_idRole) {
        this.Uti_idRole = Uti_idRole;
    }

    public void setRoleUtilisateur(RoleUtilisateur roleUtilisateur) {
        this.roleUtilisateur = roleUtilisateur;
    }

}
