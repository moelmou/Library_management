package com.javatpoint.bean;

public class Loan {
    String DateEmprunt;
    String EtuNum;
    int LivNum;

    int remis_le;

    public int getRemis_le() {
        return remis_le;
    }

    public void setRemis_le(int remis_le) {
        this.remis_le = remis_le;
    }

    public Loan() {
    }

    public void setDateEmprunt(String dateEmprunt) {
        DateEmprunt = dateEmprunt;
    }

    public void setEtuNum(String etuNum) {

         EtuNum = etuNum;
    }

    public void setLivNum(int livNum) {
        LivNum = livNum;
    }

    public String getDateEmprunt() {
        return DateEmprunt;
    }

    public String getEtuNum() {
        return EtuNum;
    }

    public int getLivNum() {
        return LivNum;
    }
}
