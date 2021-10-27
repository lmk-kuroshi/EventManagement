<%-- 
    Document   : createEvent
    Created on : Sep 29, 2021, 2:34:24 PM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.category.CategoryDAO"%>
<%@page import="com.group5.users.UserDTO"%>
<%@page import="com.group5.location.LocationDTO"%>
<%@page import="com.group5.event.EventError"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.category.CategoryDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Event Page</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
        <link href="css/createEventStyle.css" rel="stylesheet" >
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
                        <button class="las la-search" type="submit" value="Search" name="action"></button>
                        <input type="text" name="search" value="<%= search%>" placeholder="Search here"/>

                    </form>
                </div>
                <div class="user-wrapper">
                    <img src="css/img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                        <h4><%=loginUser.getName()%></h4>
                        <small>Leader</small>
                    </div>
                </div>
            </header>

            <main>
                <%
                    EventError eventError = (EventError) request.getAttribute("USER_ERROR");
                    if (eventError == null) {
                        eventError = new EventError();
                    }
                %>
                <div class="create-event-card">
                    <div class="create-event-align">
                        <h1>Create Event</h1><br>

                        <form action="MainController">
                            <span>Event Name: </span><input type="text" name="eventName"/>
                            <%= eventError.getEventNameError()%>
                            <br>
                            <br>

                            <span>Category: </span>
                            <select name="categoryID">
                                <% categoryList = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
                                    if (categoryList != null) {
                                        for (CategoryDTO category : categoryList) {
                                %>

                                <option value="<%=category.getCategoryID()%>"> <%=category.getCategoryName()%> </option>

                                <%}
                                    }
                                %>
                            </select> </br><br>
                            <span>Available Location: </span>
                            <select name="locationID">
                                <% List<LocationDTO> locationList = (List<LocationDTO>) request.getAttribute("LIST_LOCATION");
                                    if (locationList != null) {
                                        for (LocationDTO location : locationList) {
                                %>

                                <option value="<%=location.getLocationID()%>"> <%=location.getLocationName()%> </option>

                                <%}
                                    }
                                %>
                            </select>
                            <br>
                            <br>
                            <span>Event Detail: </span>
                            <br>
                            <br> <textarea id="editor" name="eventDetail"></textarea><br>
                            <%= eventError.getEventDetailError()%><br>
                            <span>Maximum seat: </span><input type="number" name="seat"/>
                            <%= eventError.getSeatError()%></br><br>

                            <span>Start Time: </span><input type="datetime-local" name="startTime"/>
                            <%= eventError.getStartTimeError()%></br><br>

                            <span>End Time: </span><input type="datetime-local" name="endTime"/>
                            <%= eventError.getEndTimeError()%></br><br>

                            <span>Image(please enter the image's link): </span>
                            <input type="text" name="image"/><br><br>

                            <span>Video(please enter a YouTube embed video link): </span>
                            <input type="text" name="video"/><br>
                            <div class="button-align">
                            <button type="submit" name="action" value="ConfirmCreateEvent">Confirm Create Event</button>
                            <button type="reset" value="Reset">Reset</button>
                            </div>
                        </form>
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
        <script defer src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
        <script>
            
            ClassicEditor
                    .create(document.querySelector('#editor'), {
                        
                        toolbar: ['Heading', '|', 'bold', 'italic', 'link', '|', 'numberedList', 'bulletedList', '|', 'undo', 'redo']
                    })
                    .catch(error => {
                        console.log(error);
                    });
            
        </script>
        
    </body>
</html>
