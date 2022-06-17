package com.javatpoint.dao;

import com.javatpoint.bean.Book;


import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;


public class BookDao {
        public static Connection getConnection() {
            Connection con = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio_db", "root", "");
            } catch (Exception e) {
                out.println(e);
            }
            return con;
        }

        public static int save(Book u) {
            int status = 0;
            try {
                Connection con = getConnection();
                Statement st = con.createStatement();
                String req1 = " INSERT INTO  books(Titre,NumEd,date_apparition,stock) \n" +
                        "VALUES('" + u.getTitre() + "'," + u.getNumero_edition() + ",'" + u.getDate() + "'," + u.getStock() + ");";
                status = st.executeUpdate(req1);

            } catch (Exception e) {
                out.println(e);
            }
            return status;
        }

        public static int update(Book u) {
            int status = 0;
            try {
                Connection con = getConnection();
                Statement st = con.createStatement();
                String titre = u.getTitre();
                int Ned = u.getNumero_edition();
                String date = u.getDate();
                int stock = u.getStock();
                int id = u.getId();
                String req = "update books set titre='" + titre + "',NumEd=" + Ned + ",date_apparition='" + date + "',stock=" + stock + " where Id=" + id + "";
                status = st.executeUpdate(req);
            } catch (Exception e) {
                out.println(e.getStackTrace());
            }
            return status;
        }

        public static int delete(Book u) {
            int status = 0;
            try {
                Connection con = getConnection();
                Statement ps = con.createStatement();
                status = ps.executeUpdate("delete from books where Id=" + u.getId());
            } catch (Exception e) {
                out.println(e);
            }
            return status;
        }

        public static List<Book> getAllRecords() {
            List<Book> list = new ArrayList<Book>();

            try {
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("select * from books where stock>0");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Book u = new Book();
                    u.setId(rs.getInt("Id"));
                    u.setTitre(rs.getString("titre"));
                    u.setNumero_edition(rs.getInt("NumEd"));
                    u.setDate(rs.getString("date_apparition"));
                    u.setStock(rs.getInt("stock"));
                    list.add(u);
                }
            } catch (Exception e) {
                out.println(e);
            }
            return list;
        }

        public static Book getRecordById(int Id) {
            Book u = null;
            try {
                Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement("select * from books where Id=?");
                ps.setInt(1, Id);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    u = new Book();
                    u.setId(rs.getInt("Id"));
                    u.setTitre(rs.getString("titre"));
                    u.setNumero_edition(rs.getInt("NumEd"));
                    u.setDate(rs.getString("date_apparition"));
                    u.setStock(rs.getInt("stock"));
                }
            } catch (Exception e) {
                out.println(e);
            }
            return u;
        }

        public static void toCSV() {
            Book u = null;
            try {
                Connection con = getConnection();
                String csvBooks = "C:\\Users\\LENOVO\\Desktop\\csv\\Livres.csv";
                String sql = "SELECT * FROM books";
                Statement statement = con.createStatement();
                ResultSet result = statement.executeQuery(sql);
                BufferedWriter fileWriter = new BufferedWriter(new FileWriter(csvBooks));
                fileWriter.write("Titre,Numero_edition,Date,Stock");
                while (result.next()) {
                    u = new Book();
                    u.setTitre(result.getString("titre"));
                    u.setNumero_edition(result.getInt("NumEd"));
                    u.setDate(result.getString("date_apparition"));
                    u.setStock(result.getInt("stock"));
                    String line = String.format("%s,%d,%s,%d",
                            u.getTitre(), u.getNumero_edition(), u.getDate(), u.getStock());
                    fileWriter.newLine();
                    fileWriter.write(line);
                }
                statement.close();
                fileWriter.close();
            }catch (SQLException e) {
                out.println("Datababse error:");
                e.printStackTrace();
            } catch (IOException e) {
                out.println("File IO error:");
                e.printStackTrace();
            }
        }
    }