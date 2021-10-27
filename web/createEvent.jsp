<%-- 
    Document   : createEvent
    Created on : Sep 29, 2021, 2:34:24 PM
    Author     : Minh Khoa
--%>

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
        <link rel="stylesheet"
              href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
        <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
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
                        <a href="index.jsp" class="active"><span class="las la-chart-line"></span> <span>Trending</span></a>
                    </li>
                    <li>
                        <a href=""><span class="lab la-buromobelexperte"></span> <span>Category</span></a>
                        <!--<span class="las la-users"></span> <span>Category</span>-->
                        <!--                        <div class="dropdown" data-dropdown>
                                                    <button class="link" data-dropdown-button>Category</button>
                                                    <div class="dropdown-menu information-grid">
                                                        <div>
                                                            <div class="dropdown-heading">Free Tutorials</div>
                                                            <div class="dropdown-links">
                                                                <a href="#" class="link">All</a>
                                                                <a href="#" class="link">Latest</a>
                                                                <a href="#" class="link">Popular</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </li>
                    <!--
 /*                <li>
                        <a href=""><span class="las la-clipboard-list"></span><span>Projects</span></a>
                    </li> --*/
                    -->                 <li>
                        <a href="ShowFollowEventController"><span class="las la-bell"></span> <span>Notify</span></a>
                    </li>

                    <li>
                        <a href="CreateEventController"><span class="las la-calendar-plus"></span><span>CreateEvent</span></a>  
                    </li>
                    <li>
                        <a href="ShowListEditEventController"><span class="las la-eye"></span><span>ShowListEditEvent</span></a>  
                    </li>
                    <li>
                        <a href="changeRole.jsp"><span class="las la-scroll"></span><span>Change Role</span></a>  
                    </li>

                    <!--
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
                        <div class="logout">
                            <form action="MainController">
                                <a> 
                                    <span class="las la-door-open"></span> <span><input type="submit" name="action" value="Logout"/> </span>
                                </a>
                            </form>
                        </div>
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
                        <button class="las la-search" type="submit" value="Search" name="action"></button>
                        <input type="text" name="search" value="<%= search%>" placeholder="Search here"/>

                    </form>
                </div>
                <div class="user-wrapper">
                    <img src="css/img/2.jpg" width="40px" height="40px" alt="" />
                    <div>
                        <h4><%=loginUser.getName()%></h4>
                        <small>Student</small>
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
                            Event Name: <input type="text" name="eventName"/>
                            <%= eventError.getEventNameError()%></br><br>

                            Category:
                            <select name="categoryID">
                                <% List<CategoryDTO> categoryList = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
                                    if (categoryList != null) {
                                        for (CategoryDTO category : categoryList) {
                                %>

                                <option value="<%=category.getCategoryID()%>"> <%=category.getCategoryName()%> </option>

                                <%}
                                    }
                                %>
                            </select> </br><br>
                            Available Location:
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
                            Event Detail: 
                            <br> <textarea id="editor" name="eventDetail"></textarea><br>
                            <%= eventError.getEventDetailError()%></br><br>
                            Maximum seat: <input type="number" name="seat"/>
                            <%= eventError.getSeatError()%></br><br>

                            Start Time: <input type="datetime-local" name="startTime"/>
                            <%= eventError.getStartTimeError()%></br><br>

                            End Time: <input type="datetime-local" name="endTime"/>
                            <%= eventError.getEndTimeError()%></br><br>

                            Image(please enter the image's link): 
                            <input type="text" name="image"/><br><br>

                            Video(please enter a YouTube embed video link):
                            <input type="text" name="video"/><br>

                            <button type="submit" name="action" value="ConfirmCreateEvent">Confirm Create Event</button>
                            <button type="reset" value="Reset">Reset</button>
                        </form>
                    </div>
                </div>
            </main>
            <footer>
                <h2><img class="logo" src="css/img/footerLogo.svg"/></h2>
                <p class="copyright">© 2021 GROUP 5</p>
            </footer>
        </div>
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
