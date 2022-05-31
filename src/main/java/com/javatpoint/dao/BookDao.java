package com.javatpoint.dao;

import com.javatpoint.bean.Book;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


    public class BookDao {
        public static Connection getConnection(){
            Connection con=null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio_db","root","");
            }catch(Exception e){System.out.println(e);}
            return con;
        }
        public static int save(Book u){
            int status=0;
            try{
                Connection con=getConnection();
                Statement st=con.createStatement();
                String req1=" INSERT INTO  books(Id,Titre,NumEd,date_apparition,stock) \n" +
                        "VALUES("+u.getId()+",'"+u.getTitre()+"',"+u.getNumero_edition()+",'"+u.getDate()+"',"+u.getStock()+");";
                status=st.executeUpdate(req1);

            }catch(Exception e){System.out.println(e);}
            return status;
        }
        public static int update(Book u){
            int status=0;
            try{
                Connection con=getConnection();
                Statement st=con.createStatement();
                String titre=u.getTitre();
                int Ned=u.getNumero_edition();
                String date=u.getDate();
                int stock=u.getStock();
                int id=u.getId();
                String req="update books set titre='"+titre+"',NumEd="+Ned+",date_apparition='"+date+"',stock="+stock+" where Id="+id+"";
                status=st.executeUpdate(req);
            }catch(Exception e){System.out.println(e.getStackTrace());}
            return status;
        }
        public static int delete(Book u){
            int status=0;
            try{
                Connection con=getConnection();
               Statement ps=con.createStatement();
                status=ps.executeUpdate("delete from books where Id="+u.getId());
            }catch(Exception e){System.out.println(e);}
            return status;
        }
        public static List<Book> getAllRecords(){
            List<Book> list=new ArrayList<Book>();

            try{
                Connection con=getConnection();
                PreparedStatement ps=con.prepareStatement("select * from books");
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    Book u=new Book();
                    u.setId(rs.getInt("Id"));
                    u.setTitre(rs.getString("titre"));
                    u.setNumero_edition(rs.getInt("NumEd"));
                    u.setDate(rs.getString("date_apparition"));
                    u.setStock(rs.getInt("stock"));
                    list.add(u);
                }
            }catch(Exception e){System.out.println(e);}
            return list;
        }
        public static Book getRecordById(int Id){
            Book u=null;
            try{
                Connection con=getConnection();
                PreparedStatement ps=con.prepareStatement("select * from books where Id=?");
                ps.setInt(1, Id);
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    u=new Book();
                    u.setId(rs.getInt("Id"));
                    u.setTitre(rs.getString("titre"));
                    u.setNumero_edition(rs.getInt("NumEd"));
                    u.setDate(rs.getString("date_apparition"));
                    u.setStock(rs.getInt("stock"));
                }
            }catch(Exception e){System.out.println(e);}
            return u;
        }
    }
