<%-- 
    Document   : registrar
    Created on : 19/08/2019, 05:11:49 AM
    Author     : Juan
--%>

<%@page import="com.sun.webkit.WebPage"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="db." %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 >Hello World!</h1>
        <%

            String nombre = request.getParameter("f_name").toString();
            String apellido = request.getParameter("s_name");
            String id = request.getParameter("id");
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
            String act_fis = request.getParameter("phy_activity");
            String dias_act = request.getParameter("day_phy_act");
            String tipo_actividad = request.getParameter("sport_act");
            String nivel_dep = request.getParameter("sport_level");
            String razon = request.getParameter("reason");
            database b = new database();
            b.conectar();
            out.print(b);

        %>
        <br>Nombre: <%=nombre%>
        <br>Apellido: <%=apellido%>
        <br>Edad: 
        <br>Cedula: <%=id%>
        <br>Genero: <%=genero%>
        <br>Categoria: <%=categoria%>
        <br>Fecha de nacimiendo: <%=bday_year%>/<%=bday_month%>/<%=bday_day%>
        <br>Estado civil: <%=estado_civil%>
        <br>Ocupacion: <%=ocupacion%>
        <br>Ciudad: <%=ciudad%>
        <br>Direccion <%=direccion%>
        <br>Email: <%=email%>
        <br>Eps: <%=eps%>
        <br>RH: <%=rh%>
        <br>Teléfono: <%=tel%>
        <br>Peso: <%=peso%>
        <br>Estatura: <%=estatura%>
        <br>Actividad física: <%=act_fis%>
        <br>Dias de actividad: <%=dias_act%>
        <br>Tipo de actividad: <%=tipo_actividad%>
        <br>Nivel deportivo: <%=nivel_dep%>
        <br>Razones para participar: <%=razon%>        
    </body>
</html>
