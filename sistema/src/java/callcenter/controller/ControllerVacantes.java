/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package callcenter.controller;

import callcenter.model.ModelVacantes;

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
public class ControllerVacantes extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        System.out.println(action);

        if (action.equals("azteca_select_requerimetos_campo")) {
            String Respuesta = ModelVacantes.azteca_select_requerimetos_campo(
                    request.getParameter("territorio"),
                    request.getParameter("etapa")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        if (action.equals("azteca_select_requerimetos_campo")) {
            String Respuesta = ModelVacantes.azteca_select_requerimetos_campo(
                    request.getParameter("territorio"),
                    request.getParameter("etapa")
            );
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.print(Respuesta);
            writer.flush();
            writer.close();
        }
        if (action.equals("azteca_select_requerimetos_campo_rh")) {
            String Respuesta = ModelVacantes.azteca_select_requerimetos_campo_rh(
                    request.getParameter("territorio"),
                    request.getParameter("etapa")
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
