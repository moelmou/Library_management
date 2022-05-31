package com.javatpoint.bean;

import java.util.Date;

public class Loan {
    Date DateEmprunt;
    int EtuNum;
    int LivNum;


    public Loan() {
    }

    public void setDateEmprunt(Date dateEmprunt) {
        DateEmprunt = dateEmprunt;
    }

    public void setEtuNum(int etuNum) {
        EtuNum = etuNum;
    }

    public void setLivNum(int livNum) {
        LivNum = livNum;
    }

    public Date getDateEmprunt() {
        return DateEmprunt;
    }

    public int getEtuNum() {
        return EtuNum;
    }

    public int getLivNum() {
        return LivNum;
    }
}
