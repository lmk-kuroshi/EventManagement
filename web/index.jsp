<%-- 
    Document   : index
    Created on : Sep 20, 2021, 2:04:14 PM
    Author     : Minh Khoa
--%>

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
        <title>Student Page</title>
        <link href="css/hompageStyle.css" rel="stylesheet" >
        <link rel="stylesheet"
              href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" />
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
<!--        <h1>Hello User: <%=loginUser.getName()%></h1>
        <h3>ID: <%=loginUser.getId()%></h3>
        <h3>Email: <%=loginUser.getEmail()%></h3>
        <h3>Role <%=loginUser.getRoleID()%></h3>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>

        <form action="MainController">
            <h2>Search <input type="text" name="search" value="<%=search%>"/>
            <input type="submit" name="action" value="Search"/>
            </h2>
        </form>
        -->          

        <%
            List<CategoryDTO> categoryList = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
            CategoryDAO catedao = new CategoryDAO();
            categoryList = catedao.getListCategory();
            request.setAttribute("LIST_CATEGORY", categoryList);
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
                        <a href=""><span class="las la-users"></span> <span>Category</span></a>
                    </li><!--
 /*                <li>
                        <a href=""><span class="las la-clipboard-list"></span><span>Projects</span></a>
                    </li> --*/
                    -->                 <li>
                        <a href=""><span class="las la-bell"></span> <span>Notify</span></a>
                    </li><!--
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
                        <select name="categoryName">
                            <option value="">All</option>
                            <%
                                if (categoryList != null) {
                                    for (CategoryDTO category : categoryList) {
                            %>

                            <option value="<%=category.getCategoryName()%>"> <%=category.getCategoryName()%> </option>

                            <%
                                    }
                                }
                            %>
                        </select>

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
                    String message = (String) request.getAttribute("SEARCH_EVENT_MESSAGE");
                    if (message == null) {
                        message = "";
                    }
                %>

                <%= message%><br>

                <%
                    List<EventDTO> list = (List<EventDTO>) request.getAttribute("LIST_EVENT");
                    if (list != null) {
                        if (!list.isEmpty()) {
                            for (EventDTO event : list) {

                %> 

                <div class="event-card">
                    <div class="event-card-single" >
                        <img src="css/img/TestEvent.jpg"/>
                        <div>
                            <a href="eventDetail.jsp?id=<%=event.getEventID()%>&name=<%=event.getEventName()%>&creatorID=<%=event.getCreatorID()%>&categoryID=<%=event.getCategoryID()%>
                               &location=<%=event.getLocationID()%>&eventDetail=<%=event.getEventDetail()%>&seat=<%=event.getSeat()%>&startTime=<%=event.getStartTime()%>
                               &endTime=<%=event.getEndTime()%>&creatTime=<%=event.getCreateTime()%>&image=<%=event.getImage()%>&video=<%=event.getVideo()%>
                               &status=<%=event.getStatus()%>"> <%=event.getEventName()%> </a>
                            <span>Start Time: <%=event.getStartTime()%></span>
                            <span>End Time: <%=event.getEndTime()%></span>
                            <span>Category: <%=event.getCategoryID()%></span>
                        </div>
                    </div>
                </div>


<!--                <a href="eventDetail.jsp?id=<%=event.getEventID()%>&name=<%=event.getEventName()%>&creatorID=<%=event.getCreatorID()%>&categoryID=<%=event.getCategoryID()%>
                   &location=<%=event.getLocationID()%>&eventDetail=<%=event.getEventDetail()%>&seat=<%=event.getSeat()%>&startTime=<%=event.getStartTime()%>
                   &endTime=<%=event.getEndTime()%>&creatTime=<%=event.getCreateTime()%>&image=<%=event.getImage()%>&video=<%=event.getVideo()%>
                   &status=<%=event.getStatus()%>"> <%=event.getEventName()%> </a></br>-->

                <%
                            }
                        }
                    }
                %>
            </main>
            <footer>
                <h2><img class="logo" src="css/img/footerLogo.svg"/></h2>
                <p class="copyright">© 2021 GROUP 5</p>
            </footer>
        </div>
        <a href="changeRole.jsp">Change Role</a>  
    </body>
</html>
