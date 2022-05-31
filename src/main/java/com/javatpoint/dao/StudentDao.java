package com.javatpoint.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.javatpoint.bean.Student;
public class StudentDao {

        public static Connection getConnection(){
            Connection con=null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio_db","root","");
            }catch(Exception e){System.out.println(e);}
            return con;
        }
        public static int save(Student u){
            int status=0;
            try{
                Connection con=getConnection();
                Statement st=con.createStatement();
                String req1=" INSERT INTO  students(CIN,Nom,Prenom,Filière) \n" +
                        "VALUES('"+u.getCIN()+"','"+u.getNom()+"','"+u.getPrenom()+"','"+u.getFiliere()+"')";
                status=st.executeUpdate(req1);
            }catch(Exception e){System.out.println(e);}
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
            }catch(Exception e){System.out.println(e);}
            return status;
        }
        public static int delete(Student u){
            int status=0;
            try{
                Connection con=getConnection();
                PreparedStatement ps=con.prepareStatement("delete from students where CIN=?");
                ps.setString(1,u.getCIN());
                status=ps.executeUpdate();
            }catch(Exception e){System.out.println(e);}

            return status;
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
            }catch(Exception e){System.out.println(e);}
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
            }catch(Exception e){System.out.println(e);}
            return u;
        }
    }

