<%@page import="com.emergentes.modelo.estudiante"%>
<%@page import="java.util.ArrayList"%>
<% if(session.getAttribute("listaest")==null){
    ArrayList<estudiante> lisaux= new ArrayList<estudiante>();
    session.setAttribute("listaest",lisaux);
    }
    ArrayList<estudiante> lista = (ArrayList<estudiante> )session.getAttribute("listaest");
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
        <center>Nombre: Jorge Elmer Payllo Aguilar</center>
        <center> Carnet: 7059307</center>
            <center> <h1>Registro de calificaciones</h1></center>
       
       <a href="MainServlet?op=nuevo">nuevo registro</a>
       <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>Ef(40)</th>  
                <th>nota</th> 
                <th></th>
                <th></th>
            </tr>
            <%
                if(lista != null){
               for(estudiante item : lista){            
             %>   
          
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getP1() %></td>
                <td><%= item.getP2() %></td>
                <td><%= item.getEf() %></td>  
                <td><%=item.getP1() + item.getP2() + item.getEf() %></td>  
                <td>
                    <a href="MainServlet?op=editar&id=<%= item.getId()%>">editar</a>

                </td>
                <td>
                     <a href="MainServlet?op=eliminar&id=<%= item.getId()%>">eliminar</a>
                </td>
            </tr>
              <%
                      }
                  } 
                %>
        </table>
    </body>
</html>
