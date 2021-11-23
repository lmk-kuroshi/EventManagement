<%-- 
    Document   : admin
    Created on : Sep 21, 2021, 12:40:20 AM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.role.RoleDAO"%>
<%@page import="com.group5.status.StatusDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminStyle.css" rel="stylesheet" >
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.html");
                return;
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
                <span class="logo_name">Event</span>
            </div>
            <div class="sidebar-line"></div>
            <ul class="nav-links">
                <div class="sidebar-align">
                    <li>

                        <a href="SearchUserController">
                            <i class="las la-users"></i>
                            <span class="links_name">Users</span>
                        </a>

                        <span class="tooltip">Trending</span>
                    </li>
                    <li>
                        <a href="accountAdmin.jsp">
                            <i class='las la-user-circle' ></i>
                            <span class="links_name">Accounts</span>
                        </a>
                        <span class="tooltip">Accounts</span>
                    </li>
<!--                    <li>
                        <a href="chart.jsp">
                            <i class='las la-user-circle' ></i>
                            <span class="links_name">Chart</span>
                        </a>
                        <span class="tooltip">Chart</span>
                    </li>-->
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
                    <!--                <span class="las la-search"></span>
                                    <input type="search" placeholder="Search here" />-->
                    <form action="MainController">
                        <button class="las la-search" type="submit" value="searchUser" name="action"></button>
                        <input type="text" name="search_user" value="<%= searchUser%>" placeholder="Search here"/>

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


                <!--            <div class="search">
                                <form action="MainController">
                                    Find User <input class="srch" type="text" name="search_user" value="<%= searchUser%>"/>
                                    <button class="sbtn" type="submit" value="searchUser" name="action">Search</button>
                                </form></br>   
                            </div>
                
                            <form action="MainController">
                                <input type="submit" name="action" value="Logout"/>
                            </form></br>-->

                <%
                    List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
                    if (list != null) {
                        if (!list.isEmpty()) {
                %>
                <!--<h3>Đã tìm thấy <%= list.size()%> kết quả</h3>-->
                <table class="content-table" width="90%">
                    <thead>
                        <tr>
                            <th>No</th>
                            <!--                            <th>UserID</th>-->
                            <th>Name</th>
                            <th>Email</th>
                            <th>Status</th>
                            <th>Role</th>         
                            <th>Update</th>
                            <th>Delete</th>
                            <th>Restore</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 1;
                            for (UserDTO user : list) {
                        %>
                    <form action="MainController">
                        <tr>
                            <td><%= count++%></td>

                            <!--                            <td>
                            <%= user.getId()%>
                        </td>-->

                            <td>
                                <input type="text" name="userName" value="<%= user.getName()%>"/>
                            </td>

                            <td>
                                <!--<input type="text" name="userEmail" value="<%= user.getEmail()%>"/>-->
                                <%= user.getEmail()%>
                            </td>

                            <%
                                StatusDAO st = new StatusDAO();
                                String statusName = st.getStatusName(user.getStatus());
                                if (statusName.equals("Active")) {
                            %>
                            <td style="color: green"><%= statusName%></td>
                            <%
                            } else if (statusName.equals("Deactive")) {
                            %>
                            <td style="color: red"><%= statusName%></td>
                            <%
                                }
                            %>

                            <td>

                                <select name="roleName" >
                                    <option><%= roleName%></option>
                                    <option value="Student">Student</option>
                                    <option value="Admin">Admin</option>
                                    <option value="Mentor">Mentor</option>
                                    <option value="Club's leader">Leader</option>
                                </select>
                            </td>

                            <td>
                                <input type="hidden" name="userID" value="<%= user.getId()%>"/>
                                <input type="hidden" name="userEmail" value="<%= user.getEmail()%>"/>
                                <input type="hidden" name="search_user" value="<%= searchUser%>"/>
                                <button type="submit" value="updateUser" name="action">Update</button>
                            </td>

                            <td>
                                <input type="hidden" name="userID" value="<%= user.getId()%>"/>
                                <input type="hidden" name="userEmail" value="<%= user.getEmail()%>"/>
                                <input type="hidden" name="search_user" value="<%= searchUser%>"/>
                                <button type="submit" value="deleteUser" name="action">Delete</button>
                            </td>
                            <td>
                                <input type="hidden" name="userID" value="<%= user.getId()%>"/>
                                <input type="hidden" name="userEmail" value="<%= user.getEmail()%>"/>
                                <input type="hidden" name="search_user" value="<%= searchUser%>"/>
                                <button type="submit" value="restoreUser" name="action">Restore</button>
                            </td>
                        </tr> 
                    </form>

                    <%
                        }
                    %>

                    </tbody>
                </table>
                .
                <%
                        }
                    }
                %>


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
