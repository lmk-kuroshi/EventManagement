<%-- 
    Document   : notification
    Created on : Oct 13, 2021, 6:16:47 PM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.role.RoleDAO"%>
<%@page import="com.group5.register.RegisterDTO"%>
<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.follow.FollowDTO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/notificationStyle.css" rel="stylesheet" />
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
                        <a href="changeRole.jsp">
                            <i class="las la-scroll"></i>
                            <span class="links_name">Change Role</span>
                        </a>  
                        <span class="tooltip">Change Role</span>
                    </li>
                    <li>
                        <a href="accountStudent.jsp">
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
                        <button class="las la-search" type="submit" value="Search" name="action"></button>
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
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%=loginUser.getId()%>"/>
                            <button style="cursor: pointer" class="follow-title" type="submit" name="action" value="ShowFollowEvent">List of events you are following</button>
                        </form>

                        <%
                            List<FollowDTO> followList = (List<FollowDTO>) request.getAttribute("FOLLOW_LIST");
                            if (followList != null) {
                                if (!followList.isEmpty()) {
                        %>    
                        <table class="content-table" width="90%">
                            <thead>
                                <tr>
                                    <th></th>   
                                    <th></th>   
                                    <th></th>   
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (FollowDTO follow : followList) {
                                %>
                                <tr>
                                    <td>
                                        <img src="<%=follow.getEventImage()%>" alt="Image Event" width="180px" height="auto"/>
                                    </td>
                                    <td>
                                        <div class="event-name">
                                            <%=follow.getEventName()%>
                                        </div>
                                        <br>
                                        <span>Start: <%=follow.getStartTime()%></span>
                                        <br>
                                        <span>Ends: <%=follow.getEndTime()%></span>
                                    </td>
                                    <td>
                                        <div class="unfollowBtn-align">
                                            <form action="MainController">
                                                <input type="hidden" name="eventID" value="<%=follow.getEventID()%>"/>
                                                <button type="submit" name="action" value="FollowOrUnfollow">Unfollow</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <%

                                            }

                                        }

                                    }

                                %>
                            </tbody>

                        </table>
                        
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%=loginUser.getId()%>"/>
                            <button style="cursor: pointer" class="follow-title" type="submit" name="action" value="ShowRegisterEvent">List of events you have registered</button>
                        </form>    
                        <%
                            List<RegisterDTO> registerList = (List<RegisterDTO>) request.getAttribute("REGISTER_LIST");
                            if (registerList != null) {
                                if (!registerList.isEmpty()) {
                        %>
                        <table class="content-table" width="90%">
                            <thead>
                                <tr>
                                    <th></th>   
                                    <th></th>   
                                    <th></th>   
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (RegisterDTO register : registerList) {
                                %>
                                <tr>                                    
                                    <td>
                                        <div class="event-name">
                                            <%=register.getEventName()%>
                                        </div>
<!--                                        <br>
                                        <span>Start: </span>
                                        <br>
                                        <span>Ends: </span>-->
                                    </td>
                                    <td>
                                        <div class="event-name">
                                            <%=register.getRegisterStatus()%>
                                        </div>
                                    </td>
                                </tr>
                                <%

                                            }

                                        }

                                    }

                                %>
                            </tbody>

                        </table>
                    </div>
                </div>
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

