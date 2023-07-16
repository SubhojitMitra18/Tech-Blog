<%-- 
    Document   : register_page
    Created on : 11 Jul, 2023, 4:41:44 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 99%, 80% 90%, 50% 100%, 20% 90%, 0 100%, 0% 35%, 0 0);
            }</style>
    </head>
    <body>
        <%@include file='normal_navbar.jsp'%>
        <main class="banner-background primary-background p-5" styles="padding-bottom:80px;">

            <div class='container'>
                <div class='col-md-6 offset-md-3'>

                    <div class='card'>
                        <div class='card-header text-center primary-background text-black'>
                            <span class='fa fa-3x fa-user-circle'></span><br>
                            Register Here
                        </div>
                        <div class='card-body'>
                            <form id="reg-form" action="RegisterServlet" method="post">


                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name" required="true">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="true">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="true">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select gender: </label>
                                    <input type="radio" id="gender" name="gender" value="Male">Male
                                    <input type="radio" id="gender" name="gender" value="Female">Female

                                </div>


                                <div>
                                    About Yourself :
                                    <textarea name="about" class="form-control" id=""  rows="5" palceholder="Write Something about you"></textarea>
                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                                </div>

                                <br>
                                <div class="container" id="loader" style="display: none;">
                                    <span class="	fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please Wait....</h4>
                                </div>
                                <br>
                                <button type="submit" class="btn btn-primary"id="submit-btn">Submit</button>

                            </form>
                        </div>
                    </div>




                </div>
            </div>

        </main>






        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>      
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded.....");
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    // send to register servlet 
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            if(data.trim()==='Done')
                            {
                            swal("Successfully Registered!!!, Redirecting you to login page")
                                    .then((value) => {
                                        window.location="login_page.jsp";
                                    });
                                    }
                                    else if(data.trim()==='Box not checked')
                                    {
                                        swal(data);
                                    }
                                    else if(data.trim()==='Error')
                                    {
                                        swal(data);
                                    }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal("Something went wrong!!!!! Please try again.....");
                                   
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>>
    </body>
</html>
