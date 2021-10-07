/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Minh Khoa
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String SEARCH = "SearchController";
    private static final String LOGOUT = "LogoutController";
    private static final String CREATE_EVENT = "CreateEventController";
    private static final String CONFIRM_CREATE_EVENT = "ConfirmCreateController";
    private static final String SHOW_LIST_EDIT_EVENT = "ShowListEditEventController";
    private static final String EDIT_EVENT = "EditEventController";
    private static final String CONFIRM_EDIT_EVENT = "ConfirmEditEventController";
    private static final String ADD_FOLLOWUP = "AddFollowupController";
    private static final String SHOW_FOLLOWUP = "ShowFollowupController";
    private static final String CANCEL_EVENT = "CancelEventController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("Login".equals(action)) {
                url = LOGIN;
            } else if("Search".equals(action)){
                url = SEARCH;
            } else if("Logout".equals(action)){
                url = LOGOUT;
            } else if("CreateEvent".equals(action)){
                url = CREATE_EVENT;
            } else if("ConfirmCreateEvent".equals(action)){
                url = CONFIRM_CREATE_EVENT;
            } else if("ShowListEditEvent".equals(action)){
                url = SHOW_LIST_EDIT_EVENT;
            } else if("EditEvent".equals(action)){
                url = EDIT_EVENT;
            } else if("ConfirmEditEvent".equals(action)){
                url = CONFIRM_EDIT_EVENT;
            } else if("AddFollowup".equals(action)){
                url = ADD_FOLLOWUP;
            } else if("ShowFollowup".equals(action)){
                url = SHOW_FOLLOWUP;
            } else if("CancelEvent".equals(action)){
                url = CANCEL_EVENT;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "Function is not supported!");
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
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
