/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.util.Date;

/**
 *
 * @author Juan
 */
public class sede {
    String nombre;
    int id;
    
    
    public sede(){
        nombre = "";
        id = 0;
        
    }
    public sede(int i, String n)
    {
        id = i; 
        nombre = n;        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
