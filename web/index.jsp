<%-- 
    Document   : index
    Created on : 10 Jul, 2023, 6:58:45 PM
    Author     : dell
--%>


<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Blog</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: url(img/homebg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .banner-background{
            clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 99%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0% 35%, 0 0);
            }
        </style>
    </head>
    <body>

        <%@include file="normal_navbar.jsp" %>

        
        
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-black banner-background" >
                <div class="container text-black">
                    <h3 class="display-3">Hi, Welcome to My Blogging Site</h3>
                   <b> <p>Post information and ideas for innovation</p>
                    <p>I am Subhojit Mitra, I am a programmer, web-application developer, Full Stack project Developer, Back-end developer using JSP, Servlet, Spring, Hibernate, Flask, Django.</p>
                    <p>Career Goal: To become a skilled software developer specializing in web development.</p></b>
                    <strong><p>You can find my details on my CV available below.</p></strong>
                    
                    <div class='container'>
                        <a href='Subhojit Mitra final.pdf' class='btn btn-outline-light btn-lg'>Download My CV <span class='fa fa-mortar-board'></span></a></div>
                    <br>
                    <a href="register_page.jsp" class='btn btn-outline-light btn-lg'><span class='fa fa-external-link'></span> Get Started</a>
                    <a href='login_page.jsp' class='btn btn-outline-light btn-lg'><span class='fa fa-sign-in'></span> Login</a>
                </div>
            </div>
        </div>
        <div class='container low-body'>
            <div class='row mb-2'>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Learn C Language Here</h5>
                            <p class="card-text">Developed by Dennis Ritchie in the early 1970s at Bell Labs. It is a widely used language known for its efficiency, flexibility, and low-level system programming capabilities.</p>
                            <a href="#" class="btn primary-background text-brown">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Learn Core Java Here</h5>
                            <p class="card-text">Java is widely used for various purposes, including enterprise software development, web applications, mobile app development (Android), scientific computing, and more.</p>
                            <a href="#" class="btn primary-background text-brown">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Learn Mathematics for programming here!!!</h5>
                            <p class="card-text">Mathematics plays a fundamental role in computer science and is the foundation of many key concepts and techniques used in the field. Mathematics is compulsory. </p>
                            <a href="#" class="btn primary-background text-brown">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class='row'>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Know career goals here</h5>
                            <p class="card-text">Some quick guides for you to build a strong and smooth career by professionals.</p>
                            <a href="#" class="btn primary-background text-brown">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Build Attitude Power</h5>
                            <p class="card-text">The power of attitude refers to the significant influence on someone's work.</p>
                            <a href="#" class="btn primary-background text-brown">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Learn Project management</h5>
                            <p class="card-text">Project management provides a structured framework for planning and execution.</p>
                            <a href="#" class="btn primary-background text-brown">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>      
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>