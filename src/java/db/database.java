package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
    ArrayList<part_event> participaciones;
    ArrayList<health_data> datos_salud;
    ArrayList<datos_segui> seguimientos;
    ArrayList<datos_contacto> contactos;
    ArrayList<antropometrico> antropometricos;
    ArrayList<sede> sedes;
    
    public database() {
        personas = new ArrayList<persona>();
        sedes = new ArrayList<sede>();
     
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
    //SELECTS
    public String setSedes(){
        sedes = new ArrayList<sede>();
        try{
            String sql = "SELECT * FROM SEDE";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                sede aux = new sede();
                aux.setId(resultSet.getInt("ID_SEDE"));
                aux.setNombre(resultSet.getString("NAME"));
                sedes.add(aux);
               
            }        
        }catch(Exception e){
            System.out.println("sedes"+e);
            return e.getMessage();
        }
        return "nada";
    }
    public String setParticipantes(){
        personas = new ArrayList<persona>();
        try{
            String sql = "SELECT * FROM PERSONAL_DATA";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                persona aux = new persona();
                aux.setCed(resultSet.getString("ID_PERSON"));
                aux.setNombre(resultSet.getString("NOMBRE"));
                aux.setApellido(resultSet.getString("APELLIDO"));
                aux.setTipo_doc(resultSet.getString("TIPO_DOCU"));
                aux.setGenero(resultSet.getString("GENDER"));
                aux.setFecha_nacimiento(resultSet.getString("NOMBRE"));
                aux.setEstado_civil(resultSet.getString("CIVIL_STATUS"));
                aux.setOcupacion(resultSet.getString("OCCUPATION"));
                personas.add(aux);
               
            }        
        }catch(Exception e){
            System.out.println("personas"+e);
            return e.getMessage();
        }
        return "nada";
    }
    
    
    public String insertParticipante(persona p){
        try{
            String sql  ="INSERT INTO PERSONAL_DATA VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, p.getCed());
            pr.setString(2, p.getNombre());
            pr.setString(3, p.getApellido());
            pr.setString(4, p.getTipo_doc());
            pr.setString(5, p.getGenero());
            pr.setString(6, p.getFecha_nacimiento());
            pr.setString(7, p.getEstado_civil());
            pr.setString(8, p.getOcupacion());
            pr.executeUpdate();
            return "Insertado el participante";
        }catch(Exception e){
            return e.toString();
        }
    }
    public String insertSalud(health_data p){
        try{
            String sql  ="INSERT INTO HEALTH_DATA VALUES(?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, p.getCedula());
            pr.setString(2, p.getRh());
            pr.setString(3, p.getEps());
            
            pr.executeUpdate();
            return "Insertado salud";
        }catch(Exception e){
            return e.toString();
        }
    }
    
    public ArrayList<sede> getSedes(){
        setSedes();
        return sedes;
    }
    public void desconectar(){
        con = null;
    }
    public void getDatos(persona participante, part_event participacion, health_data salud,
            datos_segui seguimiento, datos_contacto contacto, antropometrico antropo) {

    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public ArrayList<persona> getPersonas() {
        return personas;
    }

    public void setPersonas(ArrayList<persona> personas) {
        this.personas = personas;
    }

    public ArrayList<part_event> getParticipaciones() {
        return participaciones;
    }

    public void setParticipaciones(ArrayList<part_event> participaciones) {
        this.participaciones = participaciones;
    }

    public ArrayList<health_data> getDatos_salud() {
        return datos_salud;
    }

    public void setDatos_salud(ArrayList<health_data> datos_salud) {
        this.datos_salud = datos_salud;
    }

    public ArrayList<datos_segui> getSeguimientos() {
        return seguimientos;
    }

    public void setSeguimientos(ArrayList<datos_segui> seguimientos) {
        this.seguimientos = seguimientos;
    }

    public ArrayList<datos_contacto> getContactos() {
        return contactos;
    }

    public void setContactos(ArrayList<datos_contacto> contactos) {
        this.contactos = contactos;
    }

    public ArrayList<antropometrico> getAntropometricos() {
        return antropometricos;
    }

    public void setAntropometricos(ArrayList<antropometrico> antropometricos) {
        this.antropometricos = antropometricos;
    }
    
    

}
