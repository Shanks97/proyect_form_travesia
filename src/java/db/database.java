

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Juan
 */
public class database {

    public Connection con;
    private final String url = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String user = "system";
    private final String pass = "admin";

    ArrayList<persona> personas;

    public database() {
        personas = new ArrayList<persona>();
     
    }

    public boolean conectar() {
        try {
           
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(url,user,pass);
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public void getDatos(String nom) {

    }

}
