/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.group5.controller;

import com.group5.follow.FollowDAO;
import com.group5.follow.FollowDTO;
import com.group5.users.UserDTO;
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
public class FollowOrUnfollowController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ShowFollowEventController";
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url =ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String eventID = request.getParameter("eventID");
            FollowDTO follow = new FollowDTO();
            FollowDAO dao = new FollowDAO();
            follow = dao.checkFollow(eventID, user.getId());
            if(follow.getFollowID()==null){
                String followID = "FL_ID-"+System.currentTimeMillis();
                boolean checkNewFollow = dao.addFollow(new FollowDTO(followID, eventID, user.getId(), "followed"));
                if (checkNewFollow) {
                    url = SUCCESS;
                }
            }
            else{
                if (follow.getFollowStatus().equals("followed")) {
                    boolean checkUpdateFollow = dao.updateFollow(follow.getFollowID(), "unfollowed");
                    if (checkUpdateFollow) {
                        url = SUCCESS;
                    }
                }
                else if (follow.getFollowStatus().equals("unfollowed")){
                    boolean checkUpdateFollow = dao.updateFollow(follow.getFollowID(), "followed");
                    if (checkUpdateFollow) {
                        url = SUCCESS;
                    }
                }
                else{
                    url = ERROR;
                }
            }
        } catch (Exception e) {            
            request.setAttribute("ERROR_MESSAGE","Error at FollowOrUnfollowController");
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
