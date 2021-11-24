/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.controller;

import com.group5.memtorEvent.MentorEventDAO;
import com.group5.memtorEvent.MentorEventDTO;
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
public class AskQuestionController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String ERROR = "error.jsp";
    private final static String STUDENT = "askQuestion.jsp";
    private final static String LEADER = "askQuestionLeader.jsp";
    private final static String MENTOR = "askQuestionMentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String eventID = request.getParameter("eventID");
            String eventName = request.getParameter("eventName");
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            List<MentorEventDTO> mentorsThisEvent = new ArrayList<>();
            MentorEventDAO dao = new MentorEventDAO();
            mentorsThisEvent = dao.getListMentorInThisEvent(eventID);

            request.setAttribute("MENTOR_THIS_EVENT", mentorsThisEvent);
            request.setAttribute("eventID", eventID);
            request.setAttribute("eventName", eventName);
            
            if (loginUser.getRoleID().equals("STU")) {
                url = STUDENT;
            } else if (loginUser.getRoleID().equals("LD")) {
                url = LEADER;
            } else if (loginUser.getRoleID().equals("MT")) {
                url = MENTOR;
            }
           
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE", "Error at AskQuestionController!");
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
