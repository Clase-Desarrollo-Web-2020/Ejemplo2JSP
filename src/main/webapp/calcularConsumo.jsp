

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        // declarando
        int consumos=0, descuento=0;
        
        if(request.getParameter("OK") != null) {
            consumos = Integer.parseInt(
                    request.getParameter("valorConsumo"));
            
            if ((consumos >= 100) && (consumos <= 800)) { 
                descuento=consumos*10/100;
            }
            else if (consumos > 800) { 
                descuento=consumos*20/100;
            } 
            else {
                descuento=0;
            };
        };
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession(false);            
                        
            if (sesion.getAttribute("usuario") != null) {                
                String nombre = new String(sesion.getAttribute("usuario").toString().getBytes("ISO-8859-1"), "UTF-8");
                String fechasesion = sesion.getAttribute("fechalogin").toString();                        
            %> 
            <form action="calcularConsumo.jsp">
                <center>
                    Hola, <%=nombre%>!
                    <br>
                    Fecha de inicio de sesion: <%=fechasesion%>
                    <br>
                    <br>
                    <table border="1"><br>
                        <tr><td>Consumo: </td><td><input type="text" name="valorConsumo" value=<%=consumos%>></td></tr>
                        <tr><td colspan="2">
                                <input type="submit" name="OK" value="Calcular %"></td></tr>
                        <tr><td>Descuento: </td><td><input type="text" name="valorDescuento" value=<%=descuento%>></td></tr>
                        <tr><td>Total:  </td><td><input type="text" value=<%=consumos-descuento%>></td></tr>
                    </table>
                    <br>
                    <a href="salir.jsp">Cerrar sesion</a><br>
                </center>
            </form>
        <%
            } else {
                out.println("Sesion no iniciada!");
        %>
                <br><a href="iniciologin.jsp">Regresar</a>
        <%
            }
        %>
    </body>
</html>
