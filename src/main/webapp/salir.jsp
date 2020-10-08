<%
        HttpSession sesion=request.getSession();

        if (sesion != null)
        {
            sesion.invalidate();
            response.sendRedirect("iniciologin.jsp");
        }
%>