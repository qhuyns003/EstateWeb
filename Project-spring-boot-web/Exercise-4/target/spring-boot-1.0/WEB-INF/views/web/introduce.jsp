<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới thiệu</title>

    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: "Roboto",sans-serif;
        }

        :root {
            --primary-color: indianred;
            --color-text: #434A6E;
        }

        .intro {
            background-image: url(//bizweb.dktcdn.net/100/328/362/themes/894751/assets/bg_breadcrumb.png?1664350964800);
            background-size: cover;
            background-position: center top;
            padding: 25px 0px;
            background-repeat: no-repeat;
            min-height: 320px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            float: left;
            flex-flow: column;
        }

        .title-page {
            font-weight: 700;
            font-size: 48px;
            font-family: "Roboto",sans-serif;
            color: #fff;
        }

        .desc-intro {
            font-family: "Roboto",sans-serif;
            margin: 0;
            font-size: 16px;
            padding: 15px 0px 15px;
            border-radius: 0;
            font-weight: 400;
            line-height: 24px;
            background-color: transparent;
            width: 100%;
            text-align: center;
        }

        .col-xs-12 {
            width: 100%;
        }

        .desc-intro li {
            display: inline;
        }
        .home:hover {
            color: var(--primary-color)
        }

        .intro-item {
            color: indianred;
        }

        .page-content {

            /* margin-top: 5px; */
        }

        .title-head {
            font-size: 20px;
        }

        .hover-title-header:hover {
            text-decoration: underline;
            color: indianred;
        }

        .desc-page-container p {
            width: 100%;
            float: left;
            margin-bottom: 50px;
        }

        .item-desc-page-content {
            font-size: 14px;
        }

    </style>
</head>
<body>
<div class="page-wrapper">
    <%--<header>--%>
        <%--<div class="p-4">--%>
            <%--<div class="row navbar">--%>
                <%--<div class="col-12 col-md-3">--%>
                    <%--<div class="logo">--%>
                        <%--<a href="/trang-chu">--%>
                            <%--<img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo.png?1676257083798"--%>
                                 <%--alt="">--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-12 col-md-6">--%>
                    <%--<div class="item-menu">--%>
                        <%--<div class="nav nav1">--%>
                            <%--<div class="nav-item p-2">--%>
                                <%--<a class="nav-item-link" href="/trang-chu">--%>
                                    <%--<span>Trang chủ</span>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="nav-item p-2">--%>
                                <%--<a class="nav-item-link" href="">--%>
                                <%--<span style="color: var(--primary-color);">Giới thiệu</span>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="nav-item p-2">--%>
                                <%--&lt;%&ndash;<a class="nav-item-link" href="./Duan.html">&ndash;%&gt;--%>
                                <%--<a href='<c:url value='/san-pham'/>'>--%>
                                    <%--<span>Sản phẩm</span>--%>
                                    <%--&lt;%&ndash;<span style="color: var(--primary-color);">Sản phẩm</span>&ndash;%&gt;--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="nav-item p-2">--%>
                                <%--&lt;%&ndash;<a class="nav-item-link" href="./TinTuc.html">&ndash;%&gt;--%>
                                <%--<a href='<c:url value='/tin-tuc'/>'>--%>
                                    <%--<span>Tin tức</span>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="nav-item p-2">--%>
                                    <%--<a href='<c:url value='/lien-he'/>'>--%>
                                    <%--<span>Liên hệ</span>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-12 col-md-3">--%>
                    <%--<button class="btn btn-primary px-4">--%>
                        <%--Liên hệ tư vấn--%>
                    <%--</button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</header>--%>
    <!-- INTRO  -->
    <div class="intro text-center">
        <div class="title-page">Giới thiệu</div>
        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="desc-intro">
                    <li class="home" style="color: #fff;">
                        <a href="/trang-chu#"><span style="color: #fff;">Trang chủ</span></a>
                        <span class="mx-1"> /</span>
                    </li>
                    <li class="intro-item"><span>Giới thiệu</span></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- CONTENT  -->
    <div class="page-content">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-12">
                    <h1 class="title-head mt-5"><a class="hover-title-header" href="./GioiThieu.html"><strong>Giới
                        thiệu</strong></a>
                    </h1>
                    <div class="desc-page-content">
                        <div class="content-page rte minpage">
                            <p>Tòa nhà cao nhất Việt Nam J97 Tower&nbsp;&nbsp;của Công ty cổ phần công
                                nghệ&nbsp;Đom đóm chính thức cho khách hàng đặt giữ chỗ chọn mua đợt đầu vào ngày
                                Event&nbsp;<b>3/1/2025</b>. Sự kiện diễn ra lúc 18h tại nhà mẫu Sapohomes Central
                                Park, số 208 đường Nguyễn Chí Thanh, TP Hà Nội&nbsp;.– Đợt đầu đặt chỗ tầng 36 và 37
                                chỉ dành cho người nước ngoài. Các tầng còn lại tất cả các khách hàng chọn căn đặt
                                cọc từ ngày&nbsp;<b>15/1/2025</b>.</p>
                            <p><b>MỞ BÁN:</b></p>
                            <p>+ Ngày công bố giá bán và cho khách đặt cọc từ:&nbsp;<b>3/1/2025</b></p>
                            <p>+ Ngày tổ chức event mở bán:&nbsp;<b>15/1/2025</b></p>
                            <p>– Tòa nhà J97 Tower tầng sở hữu những căn hộ đẳng cấp bậc nhất Việt Nam.
                                Được nhiều các nhà đầu tư trong và ngoài nước đặc biệt quan tâm. Khi mở bán kỳ vọng
                                sẽ trở thành hiện tượng của thị trường bất động sản trong nhiều năm trở lại đây.</p>
                            <p><b>1. Tổng quan:</b></p>
                            <p>– Tổng chiều cao thiết kế: 515&nbsp;m</p>
                            <p>– Số tầng: 90 tầng nổi và 4 tầng hầm</p>
                            <p>– Tổng diện tích sàn (không gồm hầm): 198.200 m2</p>
                            <p><b>2. Diện tích căn hộ Tòa J97 Tower:</b></p>
                            <p>– Thiết kế từ: 1-2-3-4 phòng ngủ và Sky villa</p>
                            <p>– Loại 1 phòng ngủ: 54-55-66 m2</p>
                            <p>– Loại 2 phòng ngủ: 78-87-90-94 m2</p>
                            <p>– Loại 3 phòng ngủ: 106-109-133-145 m2</p>
                            <p>– Loại 4 phòng ngủ: 144-171-172-173-186-192-249-258-269-407-420-431 m2</p>
                            <p><b>3. Loại hình phát triển </b><strong>J97 Tower</strong><b>:</b></p>
                            <p>– Trung tâm thương mại, rạp chiếu phim, sân trượt băng trong nhà, gym (tầng B1,1, 2,
                                3)</p>
                            <p>– Khu club house dành cho cư dân gồm hệ thống hồ bơi, gym, spa, bar và lounge ngoài
                                trời (tầng 4).</p>
                            <p>– Sảnh lounge tiêu chuẩn 5 sao và nhà sinh hoạt cộng đồng dành cho cư dân, nhà hàng
                                cao cấp (tầng 5).</p>
                            <p>– Khu căn hộ hiện đại (tầng 6 – 40) với căn hộ 1 – 4 phòng ngủ, sky villa.</p>
                            <p>– Khách sạn SapoPearl 5 sao (tầng 42 – 76).</p>
                            <p>– Đài quan sát (tầng 79 – 90).</p>
                            <p><b>4. Thông tin kỹ thuật:</b></p>
                            <p>Số lượng căn hộ/sàn: 10 – 20 căn.</p>
                            <p>Số lượng thang máy: 26 thang máy.</p>
                            <p>Số lượng thang thoát hiểm: 2 thang.</p>
                            <p>Chiều rộng hành lang: 1,8m.</p>
                            <p>Tầng hầm để xe (tầng B2, B3).</p>
                            <p><b>Thông tin khác:</b></p>
                            <p>–&nbsp;<b>Đơn vị thiết kế:</b>&nbsp;Tập đoàn Skibidi (Hoa Kỳ)</p>
                            <p>–&nbsp;<b>Năm khởi công:</b>&nbsp;2021</p>
                            <p>–&nbsp;<b>Năm hoàn thành:</b>&nbsp;2024</p>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- FOOTER  -->
    <footer class="footer">
        <div class="container-fluid">
            <div class="top-footer text-center mt-0">
                <div class="logo logo-footer pt-5">
                    <a href="./ViewHome.html"><img src="https://i.imgur.com/AEEVa5Y.png" alt="logo-footer"></a>
                    <p class="desc-logo-footer mt-3">Với hơn 10 năm kinh nghiệm, J97Land tự hào là sàn
                        mua
                        bán, giao dịch và quảng cáo
                        bất động sản hàng đầu tại Việt Nam</p>
                    <div class="item-footer mt-5">
                        <div class="row">
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_maps.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Trụ sở chính</p>
                                    <p class="desc-footer">22 Hùng Vương, Quận Ba Đình, Hà Nội</p>
                                </div>
                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_phone.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Hotline</p>
                                    <p class="desc-footer"><a class="a-text" href="#">098828</a></p>
                                </div>
                            </div>
                            <div class="col-12 col-md-4 text-center">
                                <div class="icon-footer">
                                    <img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/place_email.png?1676257083798" alt="">
                                </div>
                                <div class="content-center-footer">
                                    <p class="mb-1 mt-3">Email</p>
                                    <p class="desc-footer"><a class="a-text" href="#">vsh@gmail.com</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <div class="border-bottom mb-5 mt-4"></div>
                </div>
            </div>
            <div class="bottom-footer container">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Thông tin công ty</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="/dang-cap-nhat">Giới thiệu chung</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Lĩnh vực hoạt động</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Tầm nhìn và sứ mệnh</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Cấu trúc tổ chức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Thành tựu và giải thưởng</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Chính sách hoạt động</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="/dang-cap-nhat">Chính sách bán hàng và tiếp thị</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Chính sách chất lượng</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Chính sách an toàn và bảo mật</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Chính sách chăm sóc khách hàng</a></p>

                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Hỗ trợ khách hàng</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="/dang-cap-nhat">Tư vấn bất động sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Hỗ trợ pháp lý</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Dịch vụ tài chính</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Dịch vụ khảo sát và thẩm định giá</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Hỗ trợ sau giao dịch</a></p>
                    </div>
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Kết nối với chúng tôi</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="/dang-cap-nhat">Fanpage</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Email</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Hotline</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="/dang-cap-nhat">Địa chỉ</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer-2">
            <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Trịnh Trần Phương Tuấn |
                Cung cấp bởi <a class="a-text group-name" href="#">J97</a></div>
        </div>
    </footer>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
