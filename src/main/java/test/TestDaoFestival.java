/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;


import dao.DaoFestival;
import static dao.DaoFestival.getLesFestivals;
import dao.DaoGroupe;
import java.sql.Connection;
import java.util.ArrayList;
import model.Festival;
import model.Groupe;


/**
 *
 * @author sio2
 */
public class TestDaoFestival {
    

    public static void main(String[] args) {
    Connection con = ConnexionBdd.ouvrirConnexion();
    
    
   /* Festival leFestival = DaoFestival.getLeFestival(con, 2);
    System.out.println("festival id 1 : " + leFestival.getFest_id() + " Nom du festival : " + leFestival.getFest_nom());
    */
    /*ArrayList<Festival> lesFestivals = getLesFestivals(con);
        for (int i=0; i<lesFestivals.size(); i++){
        Festival leFestival = lesFestivals.get(i);
            System.out.println("festival id : " + leFestival.getFest_id() + " Nom du festival : " + leFestival.getFest_nom());
        
        */
    
    ArrayList<Festival> lesFestivalgrp = DaoFestival.getLesFestivalsByGroupe(con, 4);
        for (int i=0; i<lesFestivalgrp.size(); i++){
            Festival festgr = lesFestivalgrp.get(i);
            System.out.println("Le festival " + festgr.getFest_nom() + " est particpé par "+ festgr.getGroupe().getNom()  );
            
        ConnexionBdd.fermerConnexion(con);
    
        }
    }
 }

