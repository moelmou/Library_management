package com.javatpoint.bean;

import java.util.Objects;

public class users {
    static String  pass;
    static String username;

    public users(String username, String pass) {
        this.setUsername(username);
        this.setPass(pass);
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public boolean verify(){
        if(Objects.equals(this.getUsername(), "@Mohamed") && Objects.equals(this.getPass(), "123456"))
            return true;
        else
            return false;

    }
}
