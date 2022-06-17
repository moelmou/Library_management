package com.javatpoint.dao;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.javatpoint.bean.Book;
import com.javatpoint.bean.Student;

import static java.lang.System.out;

public class StudentDao {

        public static Connection getConnection(){
            Connection con=null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio_db","root","");
            }catch(Exception e){
                out.println(e);}
            return con;
        }
        public static int save(Student u){
            int status=0;
            try{
                Connection con=getConnection();
                Statement st=con.createStatement();
                String req1=" INSERT INTO  students(CIN,Nom,Prenom,Filière,counts) \n" +
                        "VALUES('"+u.getCIN()+"','"+u.getNom()+"','"+u.getPrenom()+"','"+u.getFiliere()+"',"+u.getCounts()+")";
                status=st.executeUpdate(req1);
            }catch(Exception e){
                out.println(e);}
            return status;
        }
        public static int update(Student u){
            int status=0;
            try{
                Connection con=getConnection();
                Statement st=con.createStatement();
                String CIN=u.getCIN();
                String Nom=u.getNom();
                String prenom=u.getPrenom();
                String filiere=u.getFiliere();
                String req="update students set CIN='"+CIN+"',Nom='"+Nom+"',Prenom='"+prenom+"',Filière='"+filiere+"' where CIN='"+CIN+"'";
                status=st.executeUpdate(req);
            }catch(Exception e){
                out.println(e);}
            return status;
        }
        public static int delete(Student u){
            int status=0;
            try{
                Connection con=getConnection();
                PreparedStatement ps=con.prepareStatement("delete from students where CIN=?");
                ps.setString(1,u.getCIN());
                status=ps.executeUpdate();
            }catch(Exception e){
                out.println(e);}

            return status;
        }
    public static List<Student> getAllRecordsLoaning(){
        List<Student> list=new ArrayList<Student>();

        try{
            Connection con=getConnection();
            String req="select * from students where counts<3";
            Statement ps=con.createStatement();
            ResultSet rs1=ps.executeQuery(req);
            while(rs1.next()){
                Student u=new Student();
                u.setCIN(rs1.getString("CIN"));
                u.setNom(rs1.getString("Nom"));
                u.setPrenom(rs1.getString("Prenom"));
                u.setFiliere(rs1.getString("Filière"));
                u.setCounts(rs1.getInt("counts"));
                list.add(u);
            }
        }catch(Exception e){
            out.println(e);}
        return list;
    }
    public static List<Student> getAllRecordsLoaned(){
        List<Student> list=new ArrayList<Student>();

        try{
            Connection con=getConnection();
            String req="select * from students where counts>0";
            Statement ps=con.createStatement();
            ResultSet rs1=ps.executeQuery(req);
            while(rs1.next()){
                Student u=new Student();
                u.setCIN(rs1.getString("CIN"));
                u.setNom(rs1.getString("Nom"));
                u.setPrenom(rs1.getString("Prenom"));
                u.setFiliere(rs1.getString("Filière"));
                u.setCounts(rs1.getInt("counts"));
                list.add(u);
            }
        }catch(Exception e){
            out.println(e);}
        return list;
    }
        public static List<Student> getAllRecords(){
            List<Student> list=new ArrayList<Student>();

            try{
                Connection con=getConnection();
                PreparedStatement ps=con.prepareStatement("select * from students");
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    Student u=new Student();
                    u.setCIN(rs.getString("CIN"));
                    u.setNom(rs.getString("Nom"));
                    u.setPrenom(rs.getString("Prenom"));
                    u.setFiliere(rs.getString("Filière"));
                    list.add(u);
                }
            }catch(Exception e){
                out.println(e);}
            return list;
        }
        public static Student getRecordByCIN(String CIN){
            Student u=null;
            try{
                Connection con=getConnection();
                PreparedStatement ps=con.prepareStatement("select * from students where CIN=?");
                ps.setString(1,CIN);
                ResultSet rs=ps.executeQuery();
                while(rs.next()){
                    u=new Student();
                    u.setCIN(rs.getString("CIN"));
                    u.setNom(rs.getString("nom"));
                    u.setPrenom(rs.getString("prenom"));
                    u.setFiliere(rs.getString("filière"));
                }
            }catch(Exception e){
                out.println(e);}
            return u;
        }
    public static void toCSV() {
        Student u = null;
        try {
            Connection con = getConnection();
            String csvStudents = "C:\\Users\\LENOVO\\Desktop\\csv\\Etudiants.csv";
            String req = "SELECT * FROM students";
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(req);
            BufferedWriter fileWriter = new BufferedWriter(new FileWriter(csvStudents));
            fileWriter.write("CIN,Nom,Prenom,filière");
            while(result.next()){
                u=new Student();
                u.setCIN(result.getString("CIN"));
                u.setNom(result.getString("nom"));
                u.setPrenom(result.getString("prenom"));
                u.setFiliere(result.getString("filière"));
                u.setCounts(result.getInt("counts"));
                String line = String.format("%s,%s,%s,%s,%d",
                        u.getCIN(), u.getNom(), u.getPrenom(), u.getFiliere(), u.getCounts());
                fileWriter.newLine();
                fileWriter.write(line);
            }
            statement.close();
            fileWriter.close();
        } catch (SQLException e) {
           out.println("Datababse error:");
            e.printStackTrace();
        } catch (IOException e) {
           out.println("File IO error:");
            e.printStackTrace();
        }
    }
    }

