
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="verificar.jsp" method="post">
            <center>
                <table border="1"><br>
                    <tr><td>Usuario:</td><td><input type="text" name="userName"></td></tr>
                    <tr><td>Clave:</td><td><input type="password" name="password"></td></tr>
                    <tr><td colspan="2">
                            <input type="submit" name="login" value="Iniciar sesion"></td></tr>                    
                </table>
                <font color="red">
                    <%
                        if (!(request.getParameter("mensaje") == null)) {
                            out.println(request.getParameter("mensaje"));
                        }
                    %>
                </font>
            </center>
        </form>
    </body>
</html>
