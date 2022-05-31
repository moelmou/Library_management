package com.javatpoint.bean;


public class Book {
    String titre;
    int numero_edition,Id;
    String date;
    int stock;
    public Book(){}
    public Book(String titre, int numero_edition, String date, int stock) {
        this.titre = titre;
        this.numero_edition = numero_edition;
        this.date = date;
        this.stock = stock;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public int getNumero_edition() {
        return numero_edition;
    }

    public void setNumero_edition(int numero_edition) {
        this.numero_edition = numero_edition;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public void setId(int anInt) {
        this.Id = anInt;
    }
    public int getId() {
        return Id;
    }
}
