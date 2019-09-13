/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author Juan
 */
public class datos_segui {
    String cedula, deporte, categoria,razon;
    int dias_pract;
    
    public datos_segui(){
        cedula = deporte = categoria = razon="";
        dias_pract=0;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getDeporte() {
        return deporte;
    }

    public void setDeporte(String deporte) {
        this.deporte = deporte;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getRazon() {
        return razon;
    }

    public void setRazon(String razon) {
        this.razon = razon;
    }

    public int getDias_pract() {
        return dias_pract;
    }

    public void setDias_pract(int dias_pract) {
        this.dias_pract = dias_pract;
    }
    
}
