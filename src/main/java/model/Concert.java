/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author sio2
 */
public class Concert {
    private int id;
    private String date;
    private Groupe leGroupe;
    private Lieu leLieu;

    public Concert() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Groupe getLeGroupe() {
        return leGroupe;
    }

    public void setLeGroupe(Groupe leGroupe) {
        this.leGroupe = leGroupe;
    }

    public Lieu getLeLieu() {
        return leLieu;
    }

    public void setLeLieu(Lieu leLieu) {
        this.leLieu = leLieu;
    }
    
    
}
