<%-- 
    Document   : accountStudent
    Created on : Oct 25, 2021, 3:45:10 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page import="com.group5.role.RoleDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Admin Page</title>
        <link href="css/accountStyle.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

        <!--        <script src="dropDownScipt.js" defer></script>-->
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
            String searchUser = (String) request.getParameter("searchUser");
            if (searchUser == null) {
                searchUser = "";
            }
        %>    
        <%
            RoleDAO ro = new RoleDAO();
            String roleName = ro.getRoleName(loginUser.getRoleID());
        %>

        <div class="sidebar close">
            <div class="logo-details">
                <img class="logo" src="css/img/logo.png"> 
                <!--                <i class='bx bxl-c-plus-plus'></i>-->
                <span class="logo_name">Event</span>
            </div>
            <div class="sidebar-line"></div>
            <ul class="nav-links">
                <div class="sidebar-align">
                    <li>

                        <a href="SearchUserController">
                            <!--                        <i class='bx bx-grid-alt' ></i>-->
                            <i class="las la-users"></i>
                            <span class="links_name">Users</span>
                        </a>

                        <span class="tooltip">Users</span>
                    </li>
                    <li>
                        <a href="accountAdmin.jsp">
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
                        <button class="las la-search" type="submit" value="searchUser" name="action"></button>
                        <input type="text" name="search_user" value="<%= searchUser%>" placeholder="Search here"/>

                    </form>
                </div>
                <div class="user-wrapper">
                    <img src="css/img/2.jpg" width="40px" height="40px" alt="User Icon" />
                    <div>
                        <h4><%=loginUser.getName()%></h4>
                        <small><%= roleName%></small>
                    </div>
                </div>
            </header>

            <main>
                
                <div class="account-card">
                    <div class="account-card-align">
                        <div class="account-card-left">
                            <img src="css/img/accountIcon.png" width="40px" height="40px" alt="User Icon" />
                        </div>
                        <div class="account-card-right">
                            <div class="account-card-right-align">
                                <span class="bold-text">User Name: </span><span class="normal-text"><%=loginUser.getName()%></span><br><br>
                                <span class="bold-text">Email: </span><span class="normal-text"><%=loginUser.getEmail()%></span><br><br>
                                <span class="bold-text">Role: </span><span class="normal-text"><%= roleName%></span><br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <footer>
                <div class="footer-align">
                    <div class="footer-copyright">
                        <h3><img class="logo" src="css/img/logo.png"/><span>Event</span></h3>
                        <small class="copyright">Copyright ?? 2021 by GROUP 5</small>
                    </div>
                    <div class="follow-contact">
                        <h3>Contact</h3>
                        <small><span class="las la-envelope"></span><span> eventnotifygroup5@gmail.com</span></small>
                        <br>
                        <small><span class="las la-phone"></span><span> 0914 291 596</span></small>
                    </div>
                    <div class="follow-address">
                        <h3>Address</h3>
                        <small><span class="las la-map-marker-alt"></span><span> L?? E2a-7, ???????ng D1, Khu C??ng Ngh??? Cao, Long Th???nh</span>
                            <br><span> M???, Th??nh Ph??? Th??? ?????c, Th??nh ph??? H??? Ch?? Minh</span></small>
                    </div>
                </div>
            </footer>
        </div>
        <script src="js/DashboardBtn.js"></script>
        
        
    </body>
</html>
