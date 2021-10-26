/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.controller;

import com.group5.event.EventDAO;
import com.group5.event.EventDTO;
import com.group5.event.FollowupDAO;
import com.group5.event.FollowupDTO;
import com.group5.users.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Khoa
 */
public class AddFollowupController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "leader.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String eventID = request.getParameter("eventID");
            String followupDetail = request.getParameter("followupDetail");
            String followupImage = request.getParameter("followupImage");
            String followupVideo = request.getParameter("followupVideo");
            String notification = request.getParameter("notification");
            
            String followupID = "FL-"+ System.currentTimeMillis();
            
            FollowupDTO followup = new FollowupDTO(followupID, eventID, followupDetail, followupImage, followupVideo);
            FollowupDAO dao = new FollowupDAO();
             EventDAO daos = new EventDAO();
            boolean checkInsert = dao.addFollowup(followup);
                    if (checkInsert) {
                        url = SUCCESS;
                        checkInsert = daos.sendMailNotification(notification, eventID);
                    }
            
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE","Error at AddFollowupController");
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
