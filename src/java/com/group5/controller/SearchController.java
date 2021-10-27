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
public class SearchController extends HttpServlet {

    private final static String ERROR = "error.jsp";
    private final static String STUDENT = "index.jsp";
    private final static String LEADER = "leader.jsp";
    private final static String MENTOR = "mentor.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            String categoryName = request.getParameter("categoryName");
            if (categoryName == null) {
                categoryName = "";
            }
            EventDAO dao = new EventDAO();
            List<EventDTO> list = dao.getListEvent(search, categoryName);
            if (!list.isEmpty()) {
                //                request.setAttribute("LIST_EVENT", list);
                List<EventDTO> upcomingList = new ArrayList<>();
                List<EventDTO> ongoingList = new ArrayList<>();
                List<EventDTO> completeList = new ArrayList<>();
                List<EventDTO> cancelList = new ArrayList<>();
                for (EventDTO event : list) {
                    if (event.getStatus().equals("Upcoming")) {
                        upcomingList.add(event);
                    } else if (event.getStatus().equals("Ongoing")) {
                        ongoingList.add(event);
                    } else if (event.getStatus().equals("Complete")) {
                        completeList.add(event);
                    } else {
                        cancelList.add(event);
                    }
                }
                request.setAttribute("LIST_EVENT_UPCOMING", upcomingList);
                request.setAttribute("LIST_EVENT_ONGOING", ongoingList);
                request.setAttribute("LIST_EVENT_COMPLETE", completeList);
                request.setAttribute("LIST_EVENT_CANCELED", cancelList);
                if (categoryName != "") {
                    String message = "Event with category " + categoryName;
                    request.setAttribute("SEARCH_EVENT_MESSAGE", message);
                }
            } else {
                request.setAttribute("SEARCH_EVENT_MESSAGE", "No search results found");
            }

            if (loginUser.getRoleID().equals("STU")) {
                url = STUDENT;
            } else if (loginUser.getRoleID().equals("LD")) {
                url = LEADER;
            } else if (loginUser.getRoleID().equals("MT")) {
                url = MENTOR;
            }
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
