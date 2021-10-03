<%-- 
    Document   : createEvent
    Created on : Sep 29, 2021, 2:34:24 PM
    Author     : Minh Khoa
--%>

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
    </head>
    <body>
        <%
            EventError eventError = (EventError) request.getAttribute("USER_ERROR");
            if (eventError == null) {
                eventError = new EventError();
            }
        %>
        
        <h1>Create Event</h1>
        
        <form action="MainController">
            Event Name: <input type="text" name="eventName"/>
            <%= eventError.getEventNameError()%></br>
            
            Category:
            <select name="categoryID">
                <% List<CategoryDTO> categoryList =(List<CategoryDTO>) request.getAttribute("LIST_CATEGORY");
                if(categoryList != null){
                    for (CategoryDTO category : categoryList) {
                %>
                
                    <option value="<%=category.getCategoryID()%>"> <%=category.getCategoryName()%> </option>
                
                <%}
                        }
                %>
            </select> </br>
            Available Location:
            <select name="locationID">
                <% List<LocationDTO> locationList =(List<LocationDTO>) request.getAttribute("LIST_LOCATION");
                if(locationList != null){
                    for (LocationDTO location : locationList) {
                %>
                
                    <option value="<%=location.getLocationID()%>"> <%=location.getLocationName()%> </option>
                
                <%}
                        }
                %>
            </select>
            Event Detail: <input type="text" name="eventDetail"/>
            <%= eventError.getEventDetailError()%></br>
            Maximum seat: <input type="number" name="seat"/>
            <%= eventError.getSeatError()%></br>
            
            Start Time: <input type="datetime-local" name="startTime"/>
            <%= eventError.getStartTimeError()%></br>
            
            End Time: <input type="datetime-local" name="endTime"/>
            <%= eventError.getEndTimeError()%></br>
            
            Image(please enter the image's link): 
            <input type="text" name="image"/>
            
            Video(please enter a YouTube embed video link):
            <input type="text" name="video"/>
            
            <input type="submit" name="action" value="ConfirmCreateEvent"/>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
