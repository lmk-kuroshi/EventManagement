<%-- 
    Document   : editEvent
    Created on : Sep 30, 2021, 7:37:25 AM
    Author     : Minh Khoa
--%>

<%@page import="com.group5.category.CategoryDTO"%>
<%@page import="com.group5.location.LocationDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.group5.event.EventDTO"%>
<%@page import="com.group5.event.EventError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Event Page</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
    </head>
    <body>
        <%
            EventError eventError = (EventError) request.getAttribute("EVENT_ERROR");
            if (eventError == null) {
                eventError = new EventError();
            }
        %>

        <%
            EventDTO event = (EventDTO) request.getAttribute("EVENT_EDIT");
        %>
        <form action="MainController">
            Event Name: <input type="text" name="eventName" value="<%=event.getEventName()%>"/>
            <%= eventError.getEventNameError()%></br>

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
            </select> </br>
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
            </br>
            Event Detail:<br>
<!--            <input type="text" name="eventDetail" value="<%=event.getEventDetail()%>"/>-->
            <textarea id="editor" name="eventDetail"><%=event.getEventDetail()%></textarea><br>
            <%= eventError.getEventDetailError()%></br>
            Maximum seat: <input type="number" name="seat" value="<%=event.getSeat()%>"/>
            <%= eventError.getSeatError()%></br>

            Start Time: <input type="datetime-local" name="startTime" value="<%=event.getStartTime()%>"/>
            <%= eventError.getStartTimeError()%></br>

            End Time: <input type="datetime-local" name="endTime" value="<%=event.getEndTime()%>"/>
            <%= eventError.getEndTimeError()%></br>

            Image(please enter the image's link): 
            <input type="text" name="image" value="<%=event.getImage()%>"/>

            Video(please enter a YouTube embed video link):
            <input type="text" name="video" value="<%=event.getVideo()%>"/>

            <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
            <input type="hidden" name="creatTime" value="<%=event.getCreateTime()%>"/>
            <input type="hidden" name="status" value="<%=event.getStatus()%>"/>
            <input type="hidden" name="notification" value=" new updated"/>
            <input type="submit" name="action" value="ConfirmEditEvent"/>
            <input type="reset" value="Reset"/>
        </form>
        <script>
            ClassicEditor
                    .create(document.querySelector('#editor'), {

                        toolbar: ['Heading', '|', 'bold', 'italic', 'link', '|', 'numberedList', 'bulletedList', 'outdent', 'indent', '|', 'undo', 'redo']
                    })
                    .catch(error => {
                        console.log(error);
                    });
        </script>
    </body>
</html>
