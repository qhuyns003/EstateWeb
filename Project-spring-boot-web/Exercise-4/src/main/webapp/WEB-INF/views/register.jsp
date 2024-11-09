
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--<title>Đăng nhập</title>--%>
</head>
<body>
<%--<section class="vh-100 gradient-custom form-register">&ndash;%&gt;--%>
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card text-white" style="border-radius: 1rem; background-color: indianred;">
                    <div class="card-body p-2 px-5 text-center">
                        <div class="md-5 md-4 mt-4 pb-2">
                            <h2 class="fw-bold mb-2 text-uppercase">Create an account</h2>
                            <p class="text-white-50 mb-2">Please enter your Information</p>
                            <form id="registerForm" action="/api/register" method="POST">

<%--                            <div class="row">--%>
<%--                                <div class="col-md-6 mb-2">--%>
<%--                                    <div class="form-outline">--%>
<%--                                        <label class="form-label" for="form3Example1m">First name</label>--%>
<%--                                        <input type="text" id="form3Example1m"--%>
<%--                                               class="form-control form-control-lg" />--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6 mb-2">--%>
                                    <div class="form-outline form-white mb-2">
                                        <label class="form-label" >Name</label>
                                        <input type="text" name="fullName"
                                               class="form-control form-control-lg" />
                                    </div>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="d-md-flex justify-content-start align-items-center mb-4 py-2">--%>
<%--                                <h6 class="mb-0 me-4">Gender: </h6>--%>

<%--                                <div class="form-check form-check-inline mb-0 me-4">--%>
<%--                                    <input class="form-check-input" type="radio" name="inlineRadioOptions"--%>
<%--                                           id="femaleGender" value="option1" />--%>
<%--                                    <label class="form-check-label" for="femaleGender">Female</label>--%>
<%--                                </div>--%>

<%--                                <div class="form-check form-check-inline mb-0 me-4">--%>
<%--                                    <input class="form-check-input" type="radio" name="inlineRadioOptions"--%>
<%--                                           id="maleGender" value="option2" />--%>
<%--                                    <label class="form-check-label" for="maleGender">Male</label>--%>
<%--                                </div>--%>

<%--                                <div class="form-check form-check-inline mb-0">--%>
<%--                                    <input class="form-check-input" type="radio" name="inlineRadioOptions"--%>
<%--                                           id="otherGender" value="option3" />--%>
<%--                                    <label class="form-check-label" for="otherGender">Other</label>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <div class="form-outline form-white mb-2">
                                <label class="form-label" >Username</label>
                                <input type="text" name="userName" class="form-control form-control-lg" />
                            </div>

                            <div class="form-outline form-white mb-2">
                                <label class="form-label" >Password</label>
                                <input type="password" name="password" class="form-control form-control-lg" />
                            </div>

                            <div class="form-outline form-white mb-2">
                                <label class="form-label" >Repeat your password</label>
                                <input type="password" name="passwordRepeat" class="form-control form-control-lg" />
                            </div>

<%--                            <div class="form-check d-flex justify-content-center mb-2">--%>
<%--                                <input class="form-check-input me-2" type="checkbox" value=""--%>
<%--                                       id="form2Example3cg" />--%>
<%--                                <label class="form-check-label">--%>
<%--                                    I agree all statements in <a href="#!" class="text-body"><u--%>
<%--                                        style="color: white ;">Terms of--%>
<%--                                    service</u></a>--%>
<%--                                </label>--%>
<%--                            </div>--%>


                            <button class="btn btn-outline-light btn-lg px-5" id="submitForm"  >Register</button>
                            </form>
                            <div class="d-flex justify-content-center text-center mt-2 pt-1">
                                <a href="#!" class="login-extension text-white"><i
                                        class="fab fa-facebook-f fa-lg"></i></a>
                                <a href="#!" class="login-extension text-white"><i
                                        class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                <a href="#!" class="login-extension text-white"><i
                                        class="fab fa-google fa-lg"></i></a>
                            </div>

                            <p class="text-center text-muted mt-2 mb-0">Have already an account? <a href="#!"
                                                                                                    class="fw-bold text-body"><u style="color: white ;">Login here</u></a></p>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%--</sF--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>--%>
<script>
    $('#submitForm').click(function (e){
        e.preventDefault();
        $.ajax({
            type: $('#registerForm').attr('method'), // Lấy phương thức (GET/POST) từ biểu mẫu
            url: $('#registerForm').attr('action'), // Lấy URL hành động từ biểu mẫu
            data: $('#registerForm').serialize(), // Chuyển đổi dữ liệu biểu mẫu thành chuỗi
            success: function (response) {

                alert("Đăng kí thành công " );
                window.location.href = "/trang-chu";
            },
            error: function (res) {
                if (res.status === 400) {
                    try {
                        const errorResponse = JSON.parse(res.responseText);
                        errorMessage = errorResponse.message;
                    } catch (e) {
                        // Nếu không thành công, sử dụng phản hồi văn bản thuần túy
                        errorMessage = res.responseText;
                    }

                    alert( errorMessage);
                }

            }
        });
    });
</script>


</body>
</html>
