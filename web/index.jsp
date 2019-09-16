<%-- 
    Document   : index
    Created on : 18/08/2019, 03:42:40 PM
    Author     : Juan
<!--<jsp:include page="formulario.html"></jsp:include>-->
--%>

<%@page import="db.sede"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta content="width=device-width, initial-scale=1.0" http-equiv="Content-Type" name="viewport">
        <link href="css/styles_2.css" rel="stylesheet">
        <script type="text/javascript">
            window.addEventListener("load", function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden";
                console.log("cargando");

            });

            function enable_disable(elemento) {
                val = elemento.value;

                var elementos = document.getElementsByClassName("enab");
                if (parseInt(val, 10) > 0) {

                    Array.from(elementos).forEach((x) => {
                        console.log(x);
                        x.disabled = false;
                    });
                } else {
                    Array.from(elementos).forEach((x) => {
                        console.log(x);
                        x.disabled = true;
                    });
                }

            }
            function limpiar() {
                var elemento1 = document.getElementById("month");
                var elemento2 = document.getElementById("day");
                console.log(elemento2);

                var l = elemento1.options.length;
                var s = elemento2.options.length;
                for (var i = 0; i < l; i++) {
                    console.log(elemento1.options[0]);
                    elemento1.options[0] = null;
                }
                for (var i = 0; i < s; i++) {
                    elemento2.options[0] = null;
                }
                var opcion = [];
                var opcionDef, opcionDef2;
                opcionDef = document.createElement("option");
                opcionDef.setAttribute("label", "Mes");
                opcionDef.setAttribute("disabled", "true");
                opcionDef.setAttribute("selected","true");
                elemento1.appendChild(opcionDef);
                opcionDef2 = document.createElement("option");
                opcionDef2.setAttribute("label", "Día");
                opcionDef2.setAttribute("disabled", "true");
                elemento2.appendChild(opcionDef2);
            <%
                String month[] = new DateFormatSymbols().getMonths();

                for (int i = 0; i < month.length - 1; i++) {%>

                opcion.push(document.createElement("option"));
                opcion[<%=i%>].setAttribute("value", "<%=month[i]%>");
                opcion[<%=i%>].setAttribute("label", "<%=month[i].substring(0, 1).toUpperCase() + month[i].substring(1)%>");
                elemento1.appendChild(opcion[<%=i%>]);
            <%}
            %>

            }
            function days(elemento, agno) {
                d = elemento.value;

                var elementos = document.getElementById("day");
                console.log("elementos:" + elementos);
                console.log("Elemento: " + elemento.value);
                if (d !== "mes") {
                    elementos.removeAttribute("disabled");
                    var lenght = elementos.options.length;
                    console.log(lenght);
                    for (var i = 0; i < lenght; i++) {
                        elementos.options[0] = null;
                        console.log(elementos.options[0]);
                    }
                    /*elementos.removeChild();
                     var opc1 = document.createElement("option");
                     opc1.setAttribute("label","Día");
                     opc1.setAttribute("value","");
                     opc1.setAttribute("disabled",true);
                     elementos.appendChild(opc1);*/

                    switch (d) {
                        case "enero":
                        case "marzo":
                        case "mayo":
                        case "julio":
                        case "agosto":
                        case "octubre":
                        case "diciembre":
                            var opcion = [];
                            for (var i = 1; i < 32; i++) {
                                opcion.push(document.createElement("option"));
                                opcion[i - 1].setAttribute("value", i);
                                opcion[i - 1].setAttribute("label", i);
                                elementos.appendChild(opcion[i - 1]);
                            }
                            break;
                        case "abril":
                        case "junio":
                        case "septiembre":
                        case "noviembre":
                            var opcion = [];
                            for (var i = 1; i < 31; i++) {
                                opcion.push(document.createElement("option"));
                                opcion[i - 1].setAttribute("value", i);
                                opcion[i - 1].setAttribute("label", i);
                                elementos.appendChild(opcion[i - 1]);
                            }
                            break;
                        case "febrero":
                            var opcion = [];
                            if (agno % 4 === 0) {

                                for (var i = 1; i < 30; i++) {
                                    opcion.push(document.createElement("option"));
                                    opcion[i - 1].setAttribute("value", i);
                                    opcion[i - 1].setAttribute("label", i);
                                    elementos.appendChild(opcion[i - 1]);
                                }
                            } else {
                                for (var i = 1; i < 29; i++) {
                                    opcion.push(document.createElement("option"));
                                    opcion[i - 1].setAttribute("value", i);
                                    opcion[i - 1].setAttribute("label", i);
                                    elementos.appendChild(opcion[i - 1]);
                                }
                            }

                            break;
                    }
                } else {
                    Array.from(elementos).forEach((x) => {
                        x.disabled = true;
                    });
                }
            }
        </script>
        <title>Travesía por Cundinamarca</title>

    </head>
    <body>
        <br>
        <header>
            <div name="logos" class="logos" id="logos">

            </div>
        </header>
        <div class="loader">
            <div class="loader1"></div>
        </div>
        <div>
            <div style="background-color: white; width: 80%; height:90px; margin-left: 10%;">
                <img id="logo" style="" src="images/3Recurso 2-50.jpg">
            </div>
            <br>
           <img id="logo_travesia" style="" src="images/logo_travesia.png">
            <form action="registrar.jsp" id="regForm" name="regForm">
                

                <h1 id="title_t"> Travesia por Cundinamarca</h1>
                <div class="tab" >
                    Seleccione la(s) sede(s) en la(s) que desea participar!<br><br>
                    <%
                        
                        
                        sede sedes[] ={
                            new sede(5, "Chocontá 29 de Septiembre"),
                            new sede(3, "Ubaté 4 de Octubre"),
                            new sede(8, "Zipaquirá 25 de Octubre"),
                            new sede(4, "Chía 26 de Octubre"),
                            new sede(6, "Facatativá 1 de Noviembre"),
                            new sede(7, "Soacha 8 de Noviembre"),
                            new sede(1, "Fusagasugá 16 de Noviembre"),
                            new sede(2, "Girardot 24 de Noviembre")
                        };
                        
                        for(int i=0;i<sedes.length;i++){
                            %>
                            <input type="checkbox" style="width: 5%" class="sede" name ="<%=sedes[i].getId()%>" value="sede<%=sedes[i].getId() %>"> <%=sedes[i].getNombre()%><br>
                        <%}
                    %>
                    <p><select name="id" required="">
                        <option disabled selected value="">
                            Tipo de documento
                        </option>
                        <option value="TI">
                            Tarjeta de identidad
                        </option>
                        <option value="CC">
                            Cédula de ciudadanía
                        </option>
                        <option value="CE">
                            Cédula de extranjería
                        </option>
                    </select>
                    </p>
                    <p><input type = "number"name="id_docum" oninput="this.className = ''" placeholder="Numero de identidad..."></p>
                     <label><input style="width: 5% " type="checkbox" name="pol_data" value="true"> He leido y acepto la <a target ="_blank"href="https://www.ucundinamarca.edu.co/index.php/proteccion-de-datos-personales">política de tratamiento de datos personales.</a></label>

                    </div>
                <div class="tab">
                    
                    
                    
                    <p>Datos Personales: <input class="f" name="f_name" oninput="this.className = ''" placeholder="Nombres..."></p>
                    <p><input name="s_name" oninput="this.className = ''" placeholder="Apellidos..."></p>
                    
                    <p><label>Fecha de nacimiento:</label><select class="sel_bday" name="year" onchange="limpiar();" required="">
                            <option disabled hidden="" selected value="">
                                Año
                            </option><%
                                int min_year = 1939;
                                int current_year = Calendar.getInstance().get(Calendar.YEAR);
                                for (int i = current_year-12; i >= min_year; i--) {%>
                            <option value="<%=i%>">
                                <%=i%>
                            </option><%}
                            %>
                        </select></p>
                    <p><select class="sel_bday" id="month" name="month" onchange="days(this, year.value)" required="">
                            <option disabled hidden="" selected value="">
                                Mes
                            </option>
                        </select></p>
                    <p><select id="day" name="day" required="">
                            <option disabled hidden="" selected value="">
                                Día
                            </option>
                        </select></p>
                    <p><label>Género:</label> <select name="genre" required="">
                            <option disabled hidden="" selected value="">
                                Seleccionar
                            </option>
                            <option value="masculino">
                                Masculino
                            </option>
                            <option value="femenino">
                                Femenino
                            </option>
                            <option value="otro">
                                Otro
                            </option>
                        </select></p>
                    <p><label>Estado civil:</label> <select name="civil_state" required="">
                            <option disabled hidden="" selected value="">
                                Seleccionar
                            </option>
                            <option value="soltero">
                                Soltero/a
                            </option>
                            <option value="casado">
                                Casado/a
                            </option>
                            <option value="u_libre">
                                Unión libre
                            </option>
                            <option value="viudo">
                                Viudo/a
                            </option>
                        </select></p>
                    <p><label>Ocupación:</label> <select name="occupation" required="">
                            <option disabled hidden="" selected value="">
                                Seleccionar
                            </option><%
                                String occu[] = {"Estudiante", "Docente", "Administrativo", "Egresado", "Comunidad externa a la univesidad"};
                                for (String x : occu) {
                            %>
                            <option value="<%=x%>">
                                <%=x%>
                            </option><%}
                            %>
                        </select></p>
                    <p><label>Ciudad:</label> <input name="city" placeholder="Ciudad" required="" type="text"></p>
                    <p><label>Dirección:</label> <input name="address" placeholder="Direccion" required="" type="text"></p>
                    <p><label>Teléfono:</label> <input name="phone" placeholder="1234567890" required="" type="number"></p>
                    <p><label>Correo electrónico:</label> <input name="email" placeholder="email@email.com" required="" type="email"></p>
                    
                    <p><label>Eps:          </label></p><p> <input name="eps" placeholder="EPS" required="" type="text"></p>
                    
                    <p><label>RH:</label></p><p> <select name="rh" required="">
                        <option disabled hidden="" selected value="">
                            Seleccionar
                        </option><%
                            String blood_type[] = {"O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"};
                            for (String x : blood_type) {%>
                        <option value="<%=x%>">
                            <%=x%>
                        </option><%}
                        %>
                        </select></p>   
                        
                  
                </div>
                <div class="tab">
                    <h3>Datos de Seguimiento</h3>
                    <p>
                        ¿En que categoría participará? <select name="category" required="">
                            <option disabled hidden="" selected value="">
                                Seleccionar
                            </option>
                            <option value="Novato">
                                Novato (ciclo paseo)
                            </option>
                            <option value="Avanzado">
                                Avanzado
                            </option>
                        </select>
                    </p>
                    <p>
                        <label>¿Cuantos dias a la semana realiza actividad física?</label> 
                    <p>
                        <select name="day_phy_act" onchange="enable_disable(this);">
                            <option disabled hidden="" selected value="">
                                Seleccionar
                            </option><%
                                for (int i = 0; i < 8; i++) {
                            %>
                            <option value="<%=i%>">
                                <%=i%>
                            </option><%}
                            %>
                        </select>
                    </p>
                    <p>
                        <label>Deporte o actividad física que más practica</label> 
                        <select class="enab" disabled="true" name="sport_act">
                            <option disabled hidden="" selected value="">
                                Seleccionar
                            </option><%
                                String sports[] = {"Fútbol", "Futsal", "Baloncesto", "Volleyball", "Atletismo", "Natacion",
                                    "Ciclismo", "Tenis", "Squash", "Otro"};
                                for (String x : sports) {%>
                            <option value="<%=x%>">
                                <%=x%>
                            </option><%}%>
                        </select>
                    </p>
                    <p>
                        <label>¿Cuál es su nivel deportivo?</label> 
                        <select class="enab" disabled="true" name="sport_level">
                            <option disabled hidden="" selected value="">
                                Seleccionar
                            </option>
                            <option value="recreativo">
                                Recreativo
                            </option>
                            <option value="intermedio">
                                Intermedio
                            </option>
                            <option value="avanzado">
                                Avanzado
                            </option>
                        </select>
                    </p>
                </div>
                <div class="tab">
                    Datos Antropometricos
                    <p> <label>Peso:</label></p>
                    <p><input type="number" name="weight" required></p>
                    <p> <label>Estatura:</label>
                        <input type="number" name="height" placeholder="Ingrese la estatura en centímetros" required>
                    </p>
                    <p>
                        <label>¿Por qué quiere participar en la Travesía por Cundinamarca?</label></p>
                    <p>                       
                        <textarea style="width: 95%; border: 1px solid #fbe122;" name="reason" rows="10" cols="30" placeholder="Cuentanos tu interés"></textarea>
                    </p>
                </div>
                <div style="overflow:auto;">
                    <div style="float:right;">
                        <button id="prevBtn" onclick="nextPrev(-1)" type="button">Anterior</button>                                
                        <button id="nextBtn" onclick="if (!this.form.pol_data.checked) {
                                    alert('Debe aceptar la política de tratamiento de datos antes de continuar');
                                    return false;
                                } else
                                    nextPrev(1);" type="button">Siguiente</button>
                    </div>
                </div><!-- Circles which indicates the steps of the form: -->
                <div style="text-align:center;margin-top:40px;">
                    <span class="step"></span> <span class="step"></span> <span class="step"></span><span class="step"></span>
                </div>
            </form>
        </div>
        <script src="js/functions1.js" type="text/javascript">
        </script>
    </body>
</html>
