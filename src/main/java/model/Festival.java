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
public class Festival {
    private int fest_id;
    private String fest_nom;
    private String fest_dateDebut;
    private String fest_dateFin;
    private String fest_lieu;
    private ArrayList<Groupe> lesGroupes;
    private Genre genre;
    private Groupe groupe;

    public Festival() {
    }

    public int getFest_id() {
        return fest_id;
    }

    public void setFest_id(int fest_id) {
        this.fest_id = fest_id;
    }

    public String getFest_nom() {
        return fest_nom;
    }

    public void setFest_nom(String fest_nom) {
        this.fest_nom = fest_nom;
    }

    public String getFest_dateDebut() {
        return fest_dateDebut;
    }

    public void setFest_dateDebut(String fest_dateDebut) {
        this.fest_dateDebut = fest_dateDebut;
    }

    public String getFest_dateFin() {
        return fest_dateFin;
    }

    public void setFest_dateFin(String fest_dateFin) {
        this.fest_dateFin = fest_dateFin;
    }

    public String getFest_lieu() {
        return fest_lieu;
    }

    public void setFest_lieu(String fest_lieu) {
        this.fest_lieu = fest_lieu;
    }

    public ArrayList<Groupe> getLesGroupes() {
        return lesGroupes;
    }

    public void setLesGroupes(ArrayList<Groupe> lesGroupes) {
        this.lesGroupes = lesGroupes;
    }
    
        public void addUnGroupe(Groupe unGroupe){
        if (lesGroupes == null){
            lesGroupes = new ArrayList<>();
        }
        lesGroupes.add(unGroupe);
    }

    public Groupe getGroupe() {
        return groupe;
    }

    public void setGroupe(Groupe groupe) {
        this.groupe = groupe;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }
    
    

    
    
    
    
    
    
    
    
}
