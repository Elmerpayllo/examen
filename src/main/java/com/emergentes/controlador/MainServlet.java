
package com.emergentes.controlador;

import com.emergentes.modelo.estudiante;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

   
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
          estudiante objest = new estudiante();
          int id,pos;
          
           HttpSession ses = request.getSession();
            ArrayList<estudiante> lista = (ArrayList<estudiante> )ses.getAttribute("listaest");
          
        switch(op){
            
            case "nuevo":
                request.setAttribute("miobjest",objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
                
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));
                pos=buscarporindice(request,id);
                objest = lista.get(pos);
                 request.setAttribute("miobjest",objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response); 
                break;
                
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                pos=buscarporindice(request,id);
                if(pos>=0){
                    lista.remove(pos);
                }
                request.setAttribute("listaest", op);
                response.sendRedirect("index.jsp");
                break;
                
            default:
        }
    }

       @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista= (ArrayList<estudiante>)ses.getAttribute("listaest");
        estudiante objest= new estudiante();
        objest.setId(id);
        objest.setNombre(request.getParameter("nombre"));
        objest.setP1(Integer.parseInt(request.getParameter("p1")));
        objest.setP2(Integer.parseInt(request.getParameter("p2")));
        objest.setEf(Integer.parseInt(request.getParameter("ef")));
         
        if(id==0){
            int idnuevo=obtenerid(request);
            objest.setId(idnuevo);
            lista.add(objest);
        }else{
            int pos=buscarporindice(request,id);
            lista.set(pos,objest);
        }
        request.setAttribute("listaest", lista);
        response.sendRedirect("index.jsp");


    }
         public int buscarporindice(HttpServletRequest request,int id){
                        HttpSession ses = request.getSession();
                       ArrayList<estudiante> lista= (ArrayList<estudiante>)ses.getAttribute("listaest");
                       int pos = -1;
                       if(lista!= null){
                           for(estudiante ele : lista){
                               ++pos;
                               if(ele.getId()==id){
                                   break;
                               }
                           }
                       }
                       return pos;
         }
    public int obtenerid(HttpServletRequest request){
             HttpSession ses = request.getSession();
             ArrayList<estudiante> lista= (ArrayList<estudiante>)ses.getAttribute("listaest");
             int idn=0;
             for (estudiante ele: lista) {
            idn=ele.getId();
        }
             return idn+1;
    }
}
