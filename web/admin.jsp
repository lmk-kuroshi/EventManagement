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
        <link rel="stylesheet"
              href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
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

        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <h2><img class="logo" src="css/img/logo.png"> <span>Software</span></h2>
            </div>
            <div class="sidebar-menu">
                <ul>
                    <li>
                        <!--<a href="" class="active"><span class="las la-igloo"></span> <span>Dashboard</span></a>-->
                        <a href="admin.jsp" class="active"><span class="las la-users"></span> <span>Customers</span></a>
                    </li>
<!--                    <li>
                        <a href=""><span class="las la-users"></span> <span>Customers</span></a>
                    </li>
                    <li>
                        <a href=""><span class="las la-clipboard-list"></span>
                            <span>Projects</span></a>
                    </li>
                    <li>
                        <a href=""><span class="las la-shopping-bag"></span> <span>Orders</span></a>
                    </li>
                    <li>
                        <a href=""><span class="las la-receipt"></span> <span>Inventory</span></a>
                    </li>-->
                    <li>
                        <a href=""><span class="las la-user-circle"></span> <span>Accounts</span></a>
                    </li>
<!--                    <li>
                        <a href=""><span class="las la-clipboard-list"></span> <span>Tasks</span></a>
                    </li>-->
                    <li>
<!--                        <div class="logout">
                        <form action="MainController">
                            <a> 
                               <span class="las la-door-open"></span> <span><input type="submit" name="action" value="Logout"/> </span>
                            </a>
                        </form>
                            </div>-->

                        <a href="LogoutController"><span class="las la-door-open"></span> <span>Logout</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>

                    <span>Dashboard</span>
                </h2>
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
                        <small>Admin</small>
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

                            <%
                                RoleDAO ro = new RoleDAO();
                                String roleName = ro.getRoleName(user.getRoleID());
                            %>
                            <td>

                                <select name="roleName" >
                                    <option><%= roleName%></option>
                                    <option value="Student">Student</option>
                                    <option value="Admin">Admin</option>
                                    <option value="Mentor">Mentor</option>
                                    <option value="Club's leader">Club's leader</option>
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
                <h2><img class="logo" src="css/img/footerLogo.svg"/></h2>
                <p class="copyright">© 2021 GROUP 5</p>
            </footer>
        </div>
    </body>
</html>
