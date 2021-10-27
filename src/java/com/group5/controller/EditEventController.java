/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.controller;

import com.group5.category.CategoryDAO;
import com.group5.category.CategoryDTO;
import com.group5.event.EventDAO;
import com.group5.event.EventDTO;
import com.group5.location.LocationDAO;
import com.group5.location.LocationDTO;
import com.group5.users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Khoa
 */
public class EditEventController extends HttpServlet {

    private final static String ERROR = "error.jsp";
    private final static String SUCCESS = "editEvent.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            String eventID = request.getParameter("eventID");
            String notification = "new updated";
            
            EventDAO dao = new EventDAO();
                EventDTO event = dao.getEventByID(eventID);
            if (event != null) {
                request.setAttribute("EVENT_EDIT", event);
                url = SUCCESS;
                dao.sendMailNotification(notification, eventID);
            }
            CategoryDAO catedao = new CategoryDAO();
            List<CategoryDTO> listCategory = new ArrayList<>();
            listCategory=catedao.getListCategory();
            request.setAttribute("LIST_CATEGORY", listCategory);
            
            LocationDAO locaDAO = new LocationDAO();
            List<LocationDTO> listLocation = new ArrayList<>();
            listLocation=locaDAO.getListLocation();
            request.setAttribute("LIST_LOCATION", listLocation);
        } catch (Exception e) {
            log("Error at SearchController" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
