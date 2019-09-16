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
 *191.89.20.42
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
        participaciones = new ArrayList<part_event>();
        datos_salud = new ArrayList<health_data>();
        seguimientos = new ArrayList<datos_segui>();
        contactos = new ArrayList<datos_contacto>();
        antropometricos = new ArrayList<antropometrico>();

    }

    public boolean conectar() {
        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(url, user, pass);
            
            return true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    //SELECTS
    public String setSedes() {
        sedes = new ArrayList<sede>();
        try {
            String sql = "SELECT * FROM SEDE";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                sede aux = new sede();
                aux.setId(resultSet.getInt("ID_SEDE"));
                aux.setNombre(resultSet.getString("NAME"));
                sedes.add(aux);

            }
        } catch (Exception e) {
            System.out.println("sedes" + e);
            return e.getMessage();
        }
        return "nada";
    }

    public String verificarParticipaciones() {
        participaciones = new ArrayList<part_event>();
        String res="NADA";
        try {
            String sql = "SELECT * FROM PART_EVENT";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                part_event aux1 = new part_event();
                aux1.setCedula(resultSet.getString("ID_PERSON"));
                aux1.setId_Sede(resultSet.getInt("ID_SEDE"));
                participaciones.add(aux1);
                res="Hay algo";
            }
        } catch (Exception e) {
            return "participaciones " + e + res;
        }
        return res;
    }

    public String setParticipantes() {
        personas = new ArrayList<persona>();
        try {
            String sql = "SELECT * FROM PERSONAL_DATA";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
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
        } catch (Exception e) {
            System.out.println("personas" + e);
            return e.toString();
        }
        return "nada";
    }

    public String consultarSalud() {
        datos_salud = new ArrayList<health_data>();
        try {
            String sql = "SELECT * FROM HEALTH_DATA";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                health_data aux = new health_data();
                aux.setCedula(resultSet.getString("ID_PERSON"));
                aux.setRh(resultSet.getString("RH"));
                aux.setEps(resultSet.getString("EPS"));

                datos_salud.add(aux);

            }
        } catch (Exception e) {
            System.out.println("salud" + e);
            return e.getMessage();
        }
        return "nada";
    }

    public String consultarAntropometricos() {
        antropometricos = new ArrayList<antropometrico>();
        try {
            String sql = "SELECT * FROM ANTHROPOMETRIC_DATA";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                antropometrico aux = new antropometrico();
                aux.setCedula(resultSet.getString("ID_PERSON"));
                aux.setEstatura(resultSet.getInt("HEIGHT"));
                aux.setPeso(resultSet.getInt("WEIGHT"));

                antropometricos.add(aux);

            }
        } catch (Exception e) {
            System.out.println("antropro " + e);
            return e.getMessage();
        }
        return "nada";
    }

    public String consultarContacto() {
        contactos = new ArrayList<datos_contacto>();
        try {
            String sql = "SELECT * FROM CONTACT_DATA";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                datos_contacto aux = new datos_contacto();
                aux.setCedula(resultSet.getString("ID_PERSON"));
                aux.setTelefono(resultSet.getString("PHONE"));
                aux.setEmai(resultSet.getString("EMAIL"));
                aux.setCiudad(resultSet.getString("CITY"));
                aux.setDireccion(resultSet.getString("ADDRESS"));
                contactos.add(aux);

            }
        } catch (Exception e) {
            System.out.println("contacto " + e);
            return e.getMessage();
        }
        return "nada";
    }

    public String consultarSeguimiento() {
        seguimientos = new ArrayList<datos_segui>();
        try {
            String sql = "SELECT * FROM FOLLOW_UP_DATA";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                datos_segui aux = new datos_segui();
                aux.setCedula(resultSet.getString("ID_PERSON"));
                aux.setDeporte(resultSet.getString("SPORT"));
                aux.setCategoria(resultSet.getString("CATEGORY"));
                aux.setDias_pract(resultSet.getInt("PRAC_DAYS"));
                aux.setRazon(resultSet.getString("REASON"));
                
                seguimientos.add(aux);

            }
        } catch (Exception e) {
            System.out.println("seguimiento " + e);
            return e.getMessage();
        }
        return "nada";
    }

    public String insertParticipante(persona p) {
        try {
            String sql = "INSERT INTO PERSONAL_DATA VALUES(?,?,?,?,?,?,?,?)";
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
        } catch (Exception e) {
            return e.toString();
        }
    }

    public String insertSalud(health_data p) {
        try {
            String sql = "INSERT INTO HEALTH_DATA VALUES(?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, p.getCedula());
            pr.setString(2, p.getRh());
            pr.setString(3, p.getEps());

            pr.executeUpdate();
            return "Insertado salud";
        } catch (Exception e) {
            return e.toString();
        }
    }

    public String insertDatos_segui(datos_segui p) {
        try {
            String sql = "INSERT INTO FOLLOW_UP_DATA VALUES(?,?,?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, p.getCedula());
            pr.setInt(2, p.getDias_pract());
            pr.setString(3, p.getDeporte());
            pr.setString(4, p.getCategoria());
            pr.setString(5, p.getRazon());
            pr.executeUpdate();
            return "Insertado datos_Seguimiento";
        } catch (Exception e) {
            return e.toString();
        }
    }

    public String insertDatos_contacto(datos_contacto p) {
        try {
            String sql = "INSERT INTO CONTACT_DATA VALUES(?,?,?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, p.getCedula());
            pr.setString(2, p.getTelefono());
            pr.setString(3, p.getEmai());
            pr.setString(4, p.getCiudad());
            pr.setString(5, p.getDireccion());
            pr.executeUpdate();
            return "Insertado datos_contacto";
        } catch (Exception e) {
            return e.toString();
        }
    }

    public String insertParticipacion(ArrayList<part_event> p) {
        try {
            String sql = "INSERT INTO PART_EVENT VALUES(?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            for (part_event x : p) {
                pr.setString(1, x.getCedula());
                pr.setInt(2, x.getId_Sede());
                pr.executeUpdate();
            }
            return "Insertado participacion";
        } catch (Exception e) {
            return e.toString();
        }
    }

    public String insertDatos_antropometricos(antropometrico p){
        try{
            String sql  ="INSERT INTO ANTHROPOMETRIC_DATA VALUES(?,?,?)";
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, p.getCedula());
            pr.setInt(2, p.getPeso());
            pr.setInt(3, p.getEstatura());
            
            pr.executeUpdate();
            return "Insertado datos_Seguimiento";
        }catch(Exception e){
            return e.toString();
        }
    }
    public ArrayList<sede> getSedes() {
        setSedes();
        return sedes;
    }

    public void desconectar() {
        con = null;
    }

    public String updateDatos() {
        setParticipantes();
        
        consultarSalud();
        consultarSeguimiento();
        consultarAntropometricos();
        consultarContacto();
        return verificarParticipaciones();
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
