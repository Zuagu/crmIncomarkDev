/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.controller;
import callcenter.model.ModelSucursal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author zuagu
 */
public class ControllerSucursales extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        
        if(action.equals("select_sucursales")) {
            String Respuesta = ModelSucursal.select_sucursales();
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("deleted_sucursales")) {
            String Respuesta = ModelSucursal.deleted_sucursales(
                    request.getParameter("id_sucursal")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("agregar_sucursal")) {
            String Respuesta = ModelSucursal.agregar_sucursal(
                    request.getParameter("nombre_sucursal")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("select_departamentos")) {
            String Respuesta = ModelSucursal.select_departamentos();
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("delete_departamento")) {
            String Respuesta = ModelSucursal.delete_departamento(
                    request.getParameter("id_departamento")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("agregar_departamento")) {
            String Respuesta = ModelSucursal.agregar_departamento(
                    request.getParameter("nombre_departamento")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("select_areas")) {
            String Respuesta = ModelSucursal.select_areas();
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("delete_area")) {
            String Respuesta = ModelSucursal.delete_area(
                    request.getParameter("id_area")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("agregar_area")) {
            String Respuesta = ModelSucursal.agregar_area(
                    request.getParameter("nombre_area")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("select_puestos")) {
            String Respuesta = ModelSucursal.select_puestos();
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        else if(action.equals("agregar_puesto")) {
            String Respuesta = ModelSucursal.agregar_puesto(
                    request.getParameter("nombre_puesto")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
