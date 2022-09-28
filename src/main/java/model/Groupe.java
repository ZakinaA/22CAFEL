/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Zakina
 */
public class Groupe {
    
    private int id;
    private String nom;
    private String dateCreation;
    private String telephone;
    private String mail;
    private String siteWeb;
    private String lieuRepetition;
    private int estSelectionne;
    private Genre genre ;
    private Dispositif dispositif;
    private ArrayList<Titre> lesTitres;
    private ArrayList<Membre> lesMembres;
    private Membre leMembreContact;
    private ArrayList<Concert> lesConcerts;

    public Groupe() {
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

    public String getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getSiteWeb() {
        return siteWeb;
    }

    public void setSiteWeb(String siteWeb) {
        this.siteWeb = siteWeb;
    }

    public String getLieuRepetition() {
        return lieuRepetition;
    }

    public void setLieuRepetition(String lieuRepetition) {
        this.lieuRepetition = lieuRepetition;
    }

    public int getEstSelectionne() {
        return estSelectionne;
    }

    public void setEstSelectionne(int estSelectionne) {
        this.estSelectionne = estSelectionne;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public Dispositif getDispositif() {
        return dispositif;
    }

    public void setDispositif(Dispositif dispositif) {
        this.dispositif = dispositif;
    }

    public ArrayList<Titre> getLesTitres() {
        return lesTitres;
    }

    public void setLesTitres(ArrayList<Titre> lesTitres) {
        this.lesTitres = lesTitres;
    }
    
    public void addUnTitre(Titre unTitre){
        if (lesTitres == null){
            lesTitres = new ArrayList<>();
        }
        lesTitres.add(unTitre);
    }
    
    public ArrayList<Membre> getLesMembres() {
        return lesMembres;
    }

    public void setLesMembres(ArrayList<Membre> lesMembres) {
        this.lesMembres = lesMembres;
    }
    
    public void addUnMembre(Membre unMembre){
        if (lesMembres == null){
            lesMembres = new ArrayList<>();
        }
        lesMembres.add(unMembre);
    }

    public Membre getLeMembreContact() {
        return leMembreContact;
    }

    public void setLeMembreContact(Membre leMembreContact) {
        this.leMembreContact = leMembreContact;
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

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
    
    
    

}
