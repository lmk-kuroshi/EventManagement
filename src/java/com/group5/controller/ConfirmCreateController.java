/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.controller;

import com.group5.event.EventDAO;
import com.group5.event.EventDTO;
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
public class ConfirmCreateController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "leader.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session =request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String eventName = request.getParameter("eventName");
            String categoryID = request.getParameter("categoryID");
            String locationID = request.getParameter("locationID");
            int seat = Integer.parseInt(request.getParameter("seat"));
            String image = request.getParameter("image");
            String eventDetail = request.getParameter("eventDetail");
            String video = request.getParameter("video");
            
            String startTimeString = request.getParameter("startTime")+":00";
            String endTimeString = request.getParameter("endTime")+":00";
            
            Timestamp startTime = Timestamp.valueOf(startTimeString.replace("T", " "));
            Timestamp endTime = Timestamp.valueOf(endTimeString.replace("T", " "));
            
            String eventID = "EV-" + Calendar.getInstance().get(Calendar.DATE) 
                        + (Calendar.getInstance().get(Calendar.MONTH) + 1) 
                        + Calendar.getInstance().get(Calendar.YEAR) + "_" 
                        + System.currentTimeMillis();
            
            Date now = new Date(System.currentTimeMillis());
            Timestamp createTime = new Timestamp(now.getTime());
            
            EventDTO newEvent = new EventDTO(eventID, eventName, user.getId(), categoryID, locationID, eventDetail, seat, createTime, startTime, endTime, image, video, "Upcoming");
            EventDAO dao = new EventDAO();
            boolean checkInsert = dao.addEvent(newEvent);
                    if (checkInsert) {
                        url = SUCCESS;
                    }
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE","Error at CreateEventController");
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
