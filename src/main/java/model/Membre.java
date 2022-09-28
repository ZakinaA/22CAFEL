/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author sio2
 */
public class Membre {
    
    private int id;
    private String nom;
    private String prenom;
    private ArrayList<Groupe> lesGroupes;
    private ArrayList<Groupe> lesGroupesContact;
    private Instrument lInstrument;
    private Statut leStatut;

    public Membre() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public ArrayList<Groupe> getLesGroupes() {
        return lesGroupes;
    }

    public void setLesGroupes(ArrayList<Groupe> lesGroupes) {
        this.lesGroupes = lesGroupes;
    }

    public ArrayList<Groupe> getLesGroupesContact() {
        return lesGroupesContact;
    }

    public void setLesGroupesContact(ArrayList<Groupe> lesGroupesContact) {
        this.lesGroupesContact = lesGroupesContact;
    }
    
    public void addUngroupe(Groupe unGroupe){
        if (lesGroupes == null){
            lesGroupes = new ArrayList<>();
        }
        lesGroupes.add(unGroupe);
    }
    
    public void addUngroupeContact(Groupe unGroupeContact){
        if (lesGroupesContact == null){
            lesGroupesContact = new ArrayList<>();
        }
        lesGroupes.add(unGroupeContact);
    }

    public Instrument getUnInstrument() {
        return lInstrument;
    }

    public void setUnInstrument(Instrument lInstrument) {
        this.lInstrument = lInstrument;
    }

    public Statut getUnStatut() {
        return leStatut;
    }

    public void setUnStatut(Statut leStatut) {
        this.leStatut = leStatut;
    }
    
    
}
