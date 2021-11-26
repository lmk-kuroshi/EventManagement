<%-- 
    Document   : GetListQuestForLeader
    Created on : Nov 25, 2021, 4:35:26 PM
    Author     : DELL
--%>

<%@page import="com.group5.role.RoleDAO"%>
<%@page import="com.group5.event.QandADTO"%>
<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>QA Page</title>
        <link href="css/ListQuestionStyle.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>  
        <%
            RoleDAO ro = new RoleDAO();
            String roleName = ro.getRoleName(loginUser.getRoleID());
        %>

        <%
            List<CategoryDTO> categoryList = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
            CategoryDAO catedao = new CategoryDAO();
            categoryList = catedao.getListCategory();
            request.setAttribute("LIST_CATEGORY", categoryList);
        %>

        <div class="sidebar close">
            <div class="logo-details">
                <img class="logo" src="css/img/logo.png"> 
                <span class="logo_name">Event</span>
            </div>
            <div class="sidebar-line"></div>
            <ul class="nav-links">
                <div class="sidebar-align">
                    <li>

                        <a href="SearchController">
                            <i class='bx bx-trending-up'></i>
                            <span class="links_name">Trending</span>
                        </a>

                        <span class="tooltip">Trending</span>
                    </li>
                    <li>
                        <div class="iocn-link">
                            <a href="#" class="open-submenu">
                                <i class='bx bx-collection' ></i>
                                <span class="links_name">Category</span>  
                                <i class='bx bxs-chevron-down arrow' ></i>
                            </a>
                        </div>
                        <ul class="sub-menu">

                            <li><a class="link_name" href="#">Category</a></li>
                                <%
                                    if (categoryList != null) {
                                        for (CategoryDTO category : categoryList) {
                                %>
                            <li><a href="SearchController?categoryName=<%=category.getCategoryName()%>"><%=category.getCategoryName()%></a></li>
                                <%
                                        }
                                    }
                                %>
                        </ul>
                    </li>
                    <li>
                        <a href="ShowFollowEventController">
                            <i class='las la-bell' ></i>
                            <span class="links_name">Notify</span>
                        </a>
                        <span class="tooltip">Notify</span>
                    </li>
                    <li>
                        <a href="ListQAStudentController">
                            <i class='las la-question' ></i>
                            <span class="links_name">Check questions</span>
                        </a>
                        <span class="tooltip">Check questions</span>
                    </li>
                    <li>
                        <a href="CreateEventController">
                            <i class='las la-calendar-plus' ></i>
                            <span class="links_name">Create Event</span>
                        </a>
                        <span class="tooltip">Create Event</span>
                    </li>
                    <li>
                        <a href="ShowListEditEventController">
                            <i class='bx bx-show'></i>
                            <span class="links_name">Show List Edit Event</span>
                        </a>
                        <span class="tooltip">Show List Edit Event</span>
                    </li>
                    <li>
                        <a href="changeRoleLeader.jsp">
                            <i class="las la-scroll"></i>
                            <span class="links_name">Change Role</span>
                        </a>  
                        <span class="tooltip">Change Role</span>
                    </li>
                    <li>
                        <a href="accountLeader.jsp">
                            <i class='las la-user-circle' ></i>
                            <span class="links_name">Accounts</span>
                        </a>
                        <span class="tooltip">Accounts</span>
                    </li>
                    <li>
                        <form action="MainController">
                            <a href="LogoutController">
                                <i class='las la-door-open' ></i>
                                <span class="links_name">Logout</span>
                            </a>
                        </form>
                        <span class="tooltip">Logout</span>
                    </li>
                </div>
            </ul>
        </div>

        <div class="main-content">
            <header>
                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn'></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="search-wrapper">
                    <form action="MainController">
                        <input type="hidden" name="editQAMentor"/>
                        <button class="las la-search" type="submit" value="Answered" name="action"></button>
                        <input type="text" name="search" value="<%= search%>" placeholder="Search here"/>
                    </form>
                </div>
                <div class="user-wrapper">
                    <img src="css/img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                        <h4><%=loginUser.getName()%></h4>
                        <small><%= roleName%></small>
                    </div>
                </div>
            </header>

            <main>




                <div class="follow-card">
                    <div class="follow-align">


                        <%            List<QandADTO> listAnswered = (List<QandADTO>) request.getAttribute("LIST_QA_STUDENT");

                            if (listAnswered != null) {
                                if (!listAnswered.isEmpty()) {


                        %>  
                        <h1>List of question you submitted</h1>
                        <table class="content-table" width="90%">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Event Name</th>   
                                    <th>Your question</th>    
                                    <th>Answer</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    
                                    for (QandADTO QAM : listAnswered) {

                                %>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div class="event-name">
                                            <%=QAM.getEventName()%>
                                        </div>
                                    </td>
                                    <td>
                                        <span>
                                            <%=QAM.getQuestionDetail()%>
                                        </span>
                                    </td>
                                    <td>
                                        <span>
                                            <%
                                                if (QAM.getReply() == null || QAM.getReply().equals("")) {
                                            %>Your question haven't been answered yet <%
                                            } else {%>
                                            <%= QAM.getReply()%>
                                            <%}%>
                                        </span>
                                    </td>

                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                            <%
                            } else { %>
                            <h1>You haven't asked any question yet</h1>
                            <%

                                    }
                                }

                            %>
                        </table>
                    </div>
                </div>


                <%            String message = (String) request.getAttribute("SEARCH_EVENT_MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>
                <%= message%> <br>       



            </main>
            <footer>
                <div class="footer-align">
                    <div class="footer-copyright">
                        <h3><img class="logo" src="css/img/logo.png"/><span>Event</span></h3>
                        <small class="copyright">Copyright © 2021 by GROUP 5</small>
                    </div>
                    <div class="follow-contact">
                        <h3>Contact</h3>
                        <small><span class="las la-envelope"></span><span> eventnotifygroup5@gmail.com</span></small>
                        <br>
                        <small><span class="las la-phone"></span><span> 0914 291 596</span></small>
                    </div>
                    <div class="follow-address">
                        <h3>Address</h3>
                        <small><span class="las la-map-marker-alt"></span><span> Lô E2a-7, Đường D1, Khu Công Nghệ Cao, Long Thạnh</span>
                            <br><span> Mỹ, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh</span></small>
                    </div>
                </div>
            </footer>
        </div>
        <script src="js/DashboardBtn.js"></script>    

    </body>
</html>


