/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes.controlador;

import com.emergentes.bean.BeanContacto;
import com.emergentes.entidades.Contacto;
import java.io.IOException;

import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ALEX
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id;

        BeanContacto dao = new BeanContacto();

        Contacto c = new Contacto();

        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

        switch (action) {

            case "add":
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("formContactos.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                c = dao.buscar(id);
                request.setAttribute("contacto", c);
                request.getRequestDispatcher("formContactos.jsp").forward(request, response);
                break;

            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(id);
                response.sendRedirect("MainController");
                
                
                break;

            case "view":

                List<Contacto> lista = dao.listarTodos();

                request.setAttribute("contactos", lista);

                request.getRequestDispatcher("contactos.jsp").forward(request, response);
                break;

            default:
                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BeanContacto dao = new BeanContacto();
        Contacto c = new Contacto();

        c.setId(Integer.parseInt(request.getParameter("id")));
        c.setNombre(request.getParameter("nombre"));
        c.setCorreo(request.getParameter("correo"));
        c.setTelefono(request.getParameter("telefono"));

        if (c.getId() == 0) {
            dao.insertar(c);

        }
        else{
            dao.editar(c);
        }
        response.sendRedirect("MainController");
    }

}
