/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class RoleUtilisateur {
   private int roluti_id ;
   private String roluti_libelle ;

    public RoleUtilisateur() {
    }

    public RoleUtilisateur(int roluti_id, String roluti_libelle) {
        this.roluti_id = roluti_id;
        this.roluti_libelle = roluti_libelle;
    }

    public int getRoluti_id() {
        return roluti_id;
    }

    public String getRoluti_libelle() {
        return roluti_libelle;
    }

    public void setRoluti_id(int roluti_id) {
        this.roluti_id = roluti_id;
    }

    public void setRoluti_libelle(String roluti_libelle) {
        this.roluti_libelle = roluti_libelle;
    }

}
