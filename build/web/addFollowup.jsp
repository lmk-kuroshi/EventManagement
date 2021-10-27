<%-- 
    Document   : addFollowup
    Created on : Oct 3, 2021, 7:52:10 AM
    Author     : Minh Khoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Follow Up Page</title>
        <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
    </head>
    <body>
        <%
            String eventID = request.getParameter("eventID");
            String eventName = request.getParameter("eventName");
        %>

        <h1>Add followup for event: <%=eventName%></h1>
        <form action="MainController">
            <h2>Followup Detail</h2>
            <!--            <input type="text" name="followupDetail"/>-->
            <textarea id="editor" name="followupDetail"></textarea><br>
            </br>
            Image(please enter the image's link): 
            <input type="text" name="followupImage"/>

            Video(please enter a YouTube embed video link):
            <input type="text" name="followupVideo"/>

            <input type="hidden" name="eventID" value="<%=eventID%>"/>
            <input type="hidden" name="notification" value="new updated"/>
            <input type="submit" name="action" value="AddFollowup"/>

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
