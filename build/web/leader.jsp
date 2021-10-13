<%-- 
    Document   : leader
    Created on : Sep 29, 2021, 2:10:57 PM
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
        <title>Leader Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <h1>Hello User: <%=loginUser.getName()%></h1>
        <h3>ID: <%=loginUser.getId()%></h3>
        <h3>Email: <%=loginUser.getEmail()%></h3>
        <h3>Role <%=loginUser.getRoleID()%></h3>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
        <%
            List<CategoryDTO> categoryList = (List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
            CategoryDAO catedao = new CategoryDAO();
            categoryList = catedao.getListCategory();
            request.setAttribute("LIST_CATEGORY", categoryList);
        %>
        <form action="MainController">
            <h2>Search <input type="text" name="search" value="<%=search%>" placeholder="Search here"/>
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
                <input type="submit" name="action" value="Search"/>
            </h2>
        </form>
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
        <a href="eventDetail.jsp?id=<%=event.getEventID()%>&name=<%=event.getEventName()%>&creatorID=<%=event.getCreatorID()%>&categoryID=<%=event.getCategoryID()%>
           &location=<%=event.getLocationID()%>&eventDetail=<%=event.getEventDetail()%>&seat=<%=event.getSeat()%>&startTime=<%=event.getStartTime()%>
           &endTime=<%=event.getEndTime()%>&creatTime=<%=event.getCreateTime()%>&image=<%=event.getImage()%>&video=<%=event.getVideo()%>
           &status=<%=event.getStatus()%>"> <%=event.getEventName()%> </a></br>
        <%
                    }
                }
            }
        %>
        <form action="MainController">
            <input type="submit" name="action" value="CreateEvent"/>
        </form>

        <form action="MainController">
            <input type="submit" name="action" value="ShowListEditEvent"/>
        </form>

    </body>
</html>
