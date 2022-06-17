package com.javatpoint.dao;

import com.javatpoint.bean.Book;
import com.javatpoint.bean.Loan;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

public class loanDao {
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio_db","root","");
        }catch(Exception e){
            out.println(e);}
        return con;
    }
    public static int returnById(int id_1, String CIN_1){
        int status=0;

        try{
            Connection con=getConnection();
            Statement ps= con.createStatement();
            String req0="UPDATE loans SET remis_le=1 where CIN='"+CIN_1+"' AND id="+id_1+"";
            String req1="UPDATE books SET stock=stock+1 where id="+id_1+"";
            String req2="UPDATE students SET counts=counts-1 where CIN='"+CIN_1+"'";
            status=ps.executeUpdate(req0);
            int status1=ps.executeUpdate(req1);
            int status2=ps.executeUpdate(req2);
        }catch(Exception e){
            out.println(e);}
        return status;
    }
    public static int save(Loan l){
        int status=0;
        int status1=0;
        try{
            Connection con=getConnection();
            Statement ps= con.createStatement();
            String req0="select * from loans where CIN='"+l.getEtuNum()+"' AND id="+l.getLivNum()+" AND remis_le=0";
            ResultSet rs=ps.executeQuery(req0);
            if(!rs.next()){
                l.setRemis_le(0);
                Statement st=con.createStatement();
                String req1=" INSERT INTO  loans(CIN,id,DateEmprunt,remis_le) \n" +
                        "VALUES('"+l.getEtuNum()+"','"+l.getLivNum()+"','"+l.getDateEmprunt()+"','"+l.getRemis_le()+"')";
                String req2="UPDATE students SET counts=counts+1 where CIN='"+l.getEtuNum()+"'";
                String req3="UPDATE books SET stock=stock-1 where id="+l.getLivNum();
                status=st.executeUpdate(req1);
                status1=st.executeUpdate(req2);
                int status2=st.executeUpdate(req3);
            }else {
                out.println("already Loaning it");
            }
        }catch(Exception e){
            out.println(e);}
        return status;
    }

    public static List<Book> getAllLoanedByIDRecords(String CIN_C){
        List<Book> list=new ArrayList<Book>();
        try{
            Connection con=getConnection();
            String req1="select id FROM loans WHERE CIN='"+CIN_C+"'";
            Statement ps=con.createStatement();
            ResultSet rs=ps.executeQuery(req1);
            while(rs.next()){
                int ID_g=Integer.parseInt(rs.getString("id"));
                String req0="select * from books where Id="+ID_g;
                Statement ps1=con.createStatement();
                ResultSet rs1=ps1.executeQuery(req0);
                while(rs1.next()){
                    Book b=new Book();
                    b.setId(rs1.getInt("Id"));
                    b.setTitre(rs1.getString("titre"));
                    b.setNumero_edition(rs1.getInt("NumEd"));
                    b.setDate(rs1.getString("date_apparition"));
                    list.add(b);
                }
            }
        }catch(Exception e){
            out.println(e);}
        return list;
    }
    public static List<Loan> getAllRecords(){
        List<Loan> list=new ArrayList<Loan>();
        try{
            Connection con=getConnection();
            PreparedStatement ps=con.prepareStatement("select * from loans");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                Loan l=new Loan();
                l.setEtuNum(rs.getString("CIN"));
                l.setLivNum(rs.getInt("id"));
                l.setDateEmprunt(rs.getString("DateEmprunt"));
                l.setRemis_le(rs.getInt("remis_le"));
                list.add(l);
            }
        }catch(Exception e){
            out.println(e);}
        return list;
    }
}