

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String login=request.getParameter("userName");
            String pass=request.getParameter("password");
            
            if (login.equals(null) || login.trim().equals("")
                    || pass.equals(null) || pass.trim().equals("")) {
            %>
                <jsp:forward page="iniciologin.jsp">
                    <jsp:param name="mensaje" value="El nombre de usuario y password deben tener un valor..."/>
                </jsp:forward>
            <%    
            } else {
                if (login.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("admin")) {
                    HttpSession sesion=request.getSession(true);
                    /*
                        True ? return existing session object or it will create new Session if there is no session available
                        False ? return the existing session, if there is no session available it returns null
                    */
                    sesion.setAttribute("usuario",login);
                    
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    sesion.setAttribute("fechalogin",sdf.format(new Date()));

                    response.sendRedirect("calcularConsumo.jsp");
                } else {
                %>
                    <jsp:forward page="iniciologin.jsp">
                        <jsp:param name="mensaje" value="Autenticacion no valida!"/>
                    </jsp:forward>
                <% 
                }
            }
            %>
    </body>
</html>
