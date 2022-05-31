package com.javatpoint.bean;

public class Student {
    String nom, prenom, filiere, CIN;

    public Student(String nom, String prenom, String filiere, String CIN) {
        this.nom=nom;
        this.prenom=prenom;
        this.filiere=filiere;
        this.CIN=CIN;
    }

    public Student() {

    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getFiliere() {
        return filiere;
    }

    public String getCIN() {
        return CIN;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public void setFiliere(String filiere) {
        this.filiere = filiere;
    }

    public void setCIN(String CIN) {
        this.CIN = CIN;
    }
}

