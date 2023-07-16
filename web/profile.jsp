<%-- 
    Document   : profile.jsp
    Created on : 12 Jul, 2023, 11:09:32 AM
    Author     : dell
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Catagory"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                background: url(img/bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 99%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0% 35%, 0 0);
            }</style>
    </head>
    <body>

        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span> Techblog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span>Home Page <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-anchor"></span> Catagories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programms</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data structures</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span class="fa fa-phone"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> 
                            <span class="fa fa-asterisk"></span>Post Here!!!</a>
                    </li>




                </ul>
                <ul class="navbar-nav mr-right">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">
                        <span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    <a class="nav-link" href="LogoutServlet">
                        <span class="fa fa-user-plus"></span> Logout</a>
                </ul>

            </div>
        </nav>


        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {%>

        <div class="alert <%= m.getCssClass()%> " role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>


        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4">

                    <!--first column-->
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>

                            <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Catagory> list1 = d.getAllCatagories();
                                for (Catagory cc : list1) {


                            %>
                            <a href="#"  onclick="getPosts(<%= cc.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%
                                }
                            %>

                        </div>
                    </div>
                    <!--second column-->
                    <div class="col-md-8" id="post-container">
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3>Loading......</h3>>
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            </div>
                    </div>

                </div>

            </div>

        </main>

        <!--end of main body of the page-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">

                        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5> 
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body container text-center">
                        <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 200px" alt="alt"/>

                        <h5 class="modal-title mt-3"  id="exampleModalLabel"> <%= user.getName()%></h5>

                        <div id="profile-details">
                            <!--detail-->
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email-ID:</th>
                                        <td><%= user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:</th>
                                        <td><%= user.getGender()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Status:</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on:</th>
                                        <td><%= user.getDatetime()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!--profile-edit-->
                        <div id="profile-edit" style="display: none;">
                            <h3 class="mt-2">Please Edit Carefully</h3>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID: </td>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Name: </td>
                                        <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" ></td>
                                    </tr>
                                    <tr>
                                        <td>Email: </td>
                                        <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password: </td>
                                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" ></td>
                                    </tr>
                                    <tr>
                                        <td>Gender: </td>
                                        <td><%= user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <td>About: </td>
                                        <td>
                                            <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Update DP: </td>
                                        <td>
                                            <input type="file" name="image" class="form-control">
                                        </td>
                                    </tr>
                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of modal--> 
        <!--add post modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" method="post" id="add-post-form">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---select category---</option>
                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Catagory> list = postd.getAllCatagories();
                                        for (Catagory c : list) {
                                    %>

                                    <option><%= c.getCid()%>  <%= c.getName()%></option>
                                    <%
                                        }
                                    %>

                                </select></div>
                            <div class="form-group">

                                <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter Your Content" style="height:200px"></textarea>
                            </div>

                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter Your Code(if any)" style="height:200px"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Image :</label><br>
                                <input type="file" name="pic">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end post modal-->

        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>      
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;


                $('#edit-profile-button').click(function () {

                    if (editStatus === false)
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();

                        editStatus = true;
                        $(this).text("Back");
                    } else
                    {
                        $("#profile-details").show();
                        $("#profile-edit").hide();

                        editStatus = false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>   
        <script>
            $(document).ready(function (e) {
                $('#add-post-form').on("submit", function (event) {
                    // this code is executed when form is submitted
                    event.preventDefault();
                    console.log("You have clicked on submit");
                    let form = new FormData(this);

                    // now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'Done')
                            {
                                swal("Good job!", "Saved Successfully", "success");
                            } else
                            {
                                swal("Error!", "Something went wrong!! try again....", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log("error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
 
        <!--Load posts using Ajax-->
        <script>
            
            function getPosts(catId,obj)
            {
                $('#loader').show();
                $('#post-container').hide();
                $(".c-link").removeClass('active');
                    
                $.ajax({
                    url:"load_posts.jsp",
                    data:{cid:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                $('#post-container').show();
                        $('#post-container').html(data);
                        $(obj).addClass('active');
                    
    }
                }); 
            }
            
            $(document).ready(function(e){
        let allPostRef=$('.c-link')[0];       
        getPosts(0,allPostRef);
            });  
            </script>      
    </body>
</html>
