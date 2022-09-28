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
public class Lieu {
    private int id;
    private String nomSalle;
    private String rue;
    private String cPostale;
    private String ville;
    private ArrayList<Concert> lesConcerts;

    public Lieu() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomSalle() {
        return nomSalle;
    }

    public void setNomSalle(String nomSalle) {
        this.nomSalle = nomSalle;
    }

    public String getRue() {
        return rue;
    }

    public void setRue(String rue) {
        this.rue = rue;
    }

    public String getcPostale() {
        return cPostale;
    }

    public void setcPostale(String cPostale) {
        this.cPostale = cPostale;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public ArrayList<Concert> getLesConcerts() {
        return lesConcerts;
    }

    public void setLesConcerts(ArrayList<Concert> lesConcerts) {
        this.lesConcerts = lesConcerts;
    }
    
    public void addUnConcert(Concert unConcert){
        if (lesConcerts == null){
            lesConcerts = new ArrayList<>();
        }
        lesConcerts.add(unConcert);
    }
    
    
    
    
}
