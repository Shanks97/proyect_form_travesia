<%-- 
    Document   : registrar
    Created on : 19/08/2019, 05:11:49 AM
    Author     : Juan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.webkit.WebPage"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="db.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 >Hello World!</h1>
        <%
            ArrayList<part_event> partici = new ArrayList<part_event>();
            String nombre = request.getParameter("f_name").toString();
            String apellido = request.getParameter("s_name");
            String id = request.getParameter("id_docum");
            String tipo_doc = request.getParameter("id");
            String genero = request.getParameter("genre");
            String categoria = request.getParameter("category");
            String bday_year = request.getParameter("year");
            String bday_month = request.getParameter("month");
            String bday_day = request.getParameter("day");
            String estado_civil = request.getParameter("civil_state");
            String ocupacion = request.getParameter("occupation");
            String ciudad = request.getParameter("city");
            String direccion = request.getParameter("address");
            String email = request.getParameter("email");
            String eps = request.getParameter("eps");
            String rh = request.getParameter("rh");
            String tel = request.getParameter("phone");
            String peso = request.getParameter("weight");
            String estatura = request.getParameter("height");

            String dias_act = request.getParameter("day_phy_act");
            String tipo_actividad = request.getParameter("sport_act");
            String nivel_dep = request.getParameter("sport_level");
            String razon = request.getParameter("reason");
            String sedes[] = new String[8];
            for (int i = 0; i < sedes.length; i++) {
                sedes[i] = request.getParameter("" + (i + 1));
            }
         
            database b = new database();
            b.conectar();
            out.print(b.updateDatos());

            
            if (b.getParticipaciones().size() > 0) {
                b.verificarParticipaciones();
                boolean existe = false;
                for(int i=0;i<b.getParticipaciones().size();i++){
                    out.print("Test: " +b.getParticipaciones().get(i).getCedula());
                }
                for (part_event aux : b.getParticipaciones()) {
                    out.print(aux.getCedula());
                    for (int i = 0; i < sedes.length; i++) {
                        if(sedes[i]!=null){
                            out.println(sedes[i]);
                        }
                        out.print("Cedula " + aux.getCedula());
                        if (aux.getCedula().equals(id) && aux.getId_Sede() == Integer.parseInt(sedes[i])) {
                            out.print("Existe");
                            existe = true;
                        }
                    }
                }
                if (!existe) {
                    if (b.getPersonas().size() > 0) {
                        boolean existe2 = false;
                        for (persona t : b.getPersonas()) {
                            if (t.getCed().equals(id)) {
                                existe2 = true;
                            }
                        }
                        if (!existe2) {
                            persona participante = new persona();
                            participante.setCed(id);
                            participante.setNombre(nombre);
                            participante.setApellido(apellido);
                            participante.setTipo_doc(tipo_doc);
                            participante.setGenero(genero);
                            participante.setFecha_nacimiento(bday_year + "/" + bday_month + "/" + bday_day);
                            participante.setEstado_civil(estado_civil);
                            participante.setOcupacion(ocupacion);
                            out.print(b.insertParticipante(participante));

                            health_data salud = new health_data();
                            salud.setCedula(id);
                            salud.setEps(eps);
                            salud.setRh(rh);
                            out.println(b.insertSalud(salud));

                            antropometrico ant = new antropometrico();
                            ant.setCedula(id);
                            ant.setEstatura(Integer.parseInt(estatura));
                            ant.setPeso(Integer.parseInt(peso));
                            out.println(b.insertDatos_antropometricos(ant));

                            datos_segui d_s = new datos_segui();
                            d_s.setCedula(id);
                            d_s.setCategoria(categoria);
                            d_s.setDeporte(tipo_actividad);
                            d_s.setDias_pract(Integer.parseInt(dias_act));
                            d_s.setRazon(razon);
                            out.println(b.insertDatos_segui(d_s));

                            datos_contacto d_c = new datos_contacto();
                            d_c.setCedula(id);
                            d_c.setCiudad(ciudad);
                            d_c.setDireccion(direccion);
                            d_c.setEmai(email);
                            d_c.setTelefono(tel);
                            out.println(b.insertDatos_contacto(d_c));

                        }
                        for (String x : sedes) {
                            if (x != null) {
                                part_event partic = new part_event();
                                partic.setCedula(id);
                                partic.setId_Sede(Integer.parseInt(x));
                                partici.add(partic);
                            }
                        }
                        out.println(b.insertParticipacion(partici) + " asdasd");
                    }
                    else{
                        persona participante = new persona();
                            participante.setCed(id);
                            participante.setNombre(nombre);
                            participante.setApellido(apellido);
                            participante.setTipo_doc(tipo_doc);
                            participante.setGenero(genero);
                            participante.setFecha_nacimiento(bday_year + "/" + bday_month + "/" + bday_day);
                            participante.setEstado_civil(estado_civil);
                            participante.setOcupacion(ocupacion);
                            out.print(b.insertParticipante(participante));

                            health_data salud = new health_data();
                            salud.setCedula(id);
                            salud.setEps(eps);
                            salud.setRh(rh);
                            out.println(b.insertSalud(salud));

                            antropometrico ant = new antropometrico();
                            ant.setCedula(id);
                            ant.setEstatura(Integer.parseInt(estatura));
                            ant.setPeso(Integer.parseInt(peso));
                            out.println(b.insertDatos_antropometricos(ant));

                            datos_segui d_s = new datos_segui();
                            d_s.setCedula(id);
                            d_s.setCategoria(categoria);
                            d_s.setDeporte(tipo_actividad);
                            d_s.setDias_pract(Integer.parseInt(dias_act));
                            d_s.setRazon(razon);
                            out.println(b.insertDatos_segui(d_s));

                            datos_contacto d_c = new datos_contacto();
                            d_c.setCedula(id);
                            d_c.setCiudad(ciudad);
                            d_c.setDireccion(direccion);
                            d_c.setEmai(email);
                            d_c.setTelefono(tel);
                            out.println(b.insertDatos_contacto(d_c));
                    }
                }
                b.updateDatos();
            } else {
                persona participante = new persona();
                participante.setCed(id);
                participante.setNombre(nombre);
                participante.setApellido(apellido);
                participante.setTipo_doc(tipo_doc);
                participante.setGenero(genero);
                participante.setFecha_nacimiento(bday_year + "/" + bday_month + "/" + bday_day);
                participante.setEstado_civil(estado_civil);
                participante.setOcupacion(ocupacion);
                out.print(b.insertParticipante(participante));

                health_data salud = new health_data();
                salud.setCedula(id);
                salud.setEps(eps);
                salud.setRh(rh);
                out.println(b.insertSalud(salud));

                antropometrico ant = new antropometrico();
                ant.setCedula(id);
                ant.setEstatura(Integer.parseInt(estatura));
                ant.setPeso(Integer.parseInt(peso));
                out.println(b.insertDatos_antropometricos(ant));

                datos_segui d_s = new datos_segui();
                d_s.setCedula(id);
                d_s.setCategoria(categoria);
                d_s.setDeporte(tipo_actividad);
                d_s.setDias_pract(Integer.parseInt(dias_act));
                d_s.setRazon(razon);
                out.println(b.insertDatos_segui(d_s));

                datos_contacto d_c = new datos_contacto();
                d_c.setCedula(id);
                d_c.setCiudad(ciudad);
                d_c.setDireccion(direccion);
                d_c.setEmai(email);
                d_c.setTelefono(tel);
                out.println(b.insertDatos_contacto(d_c));

                for (String x : sedes) {
                    if (x != null) {
                        part_event partic = new part_event();
                        partic.setCedula(id);
                        partic.setId_Sede(Integer.parseInt(x));
                        partici.add(partic);
                    }
                }
                out.println(b.insertParticipacion(partici));
                b.updateDatos();
            }


        %>
        <br>

    </body>
</html>
