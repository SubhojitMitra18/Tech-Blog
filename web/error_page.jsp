<%-- 
    Document   : error_page
    Created on : 12 Jul, 2023, 10:13:48 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry, Something went wrong</title>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
            clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 99%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0% 35%, 0 0);
            }</style>
    </head>
    <body>
        <div class="container text-center">
            <<img src="img/browser.png" alt="alt" height="300" class="img-fluid"/>
            <h3 class="display-3">Sorry ! Something Went Wrong...</h3>
            <%=exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3" >Home</a>
        </div>
        
    </body>
</html>
