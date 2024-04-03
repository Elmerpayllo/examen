<%@page import="com.emergentes.modelo.estudiante"%>
<%
    estudiante reg = (estudiante) request.getAttribute("miobjest");
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <center> PRIMER PARCIAL TEM-742 </center>
        <center> Nombre: Jorge Elmer Payllo Aguilar</center>
        <center> Carnet: 7059307</center>
        <center> <h1>Registro de calificaciones</h1></center>
     <form action="MainServlet" method ="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type ="text" name="id" value="<%= reg.getId()%>" size="2" readonly></td>
                    </tr>
                      <tr>
                        <td>nombre</td>
                        <td><input type ="text" name="nombre" value="<%= reg.getNombre()%>"></td>
                    </tr>
                    <tr>
                        <td>P1</td>
                        <td><input type ="text" name="p1" value="<%= reg.getP1() %>"></td>
                    </tr>
                     <tr>
                        <td>P2</td>
                        <td><input type ="text" name="p2" value="<%= reg.getP2() %>"></td>
                    </tr>
                     <tr>
                        <td>EF</td>
                        <td><input type ="text" name="ef" value="<%= reg.getEf() %>"></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type ="submit" value="enviar"></td>
                    </tr>
            </table>
            
        </form>
</body>
</html>
