<%@page import="model.c_SACHYEUTHICH"%>
<%@page import="model.m_KHACHHANG"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
<div id="contact-page">
    <div class="bg container col-sm-12" >

          <section class="col-sm-12" style="margin-bottom: 30px">
                    <h1 class="title-pages">Giới thiệu</h1>
                    <div style="text-align: left;"><span ><em>"Nếu cho tôi được sống lại cuộc đời của mình, tôi tự thề trong lúc trẻ tuổi, chỉ đọc dòng sách hay, do những bậc vĩ nhân trong tư tưởng giới viết ra thôi... Tôi đã mua cái giá rất đắt cho việc đọc những quyển sách vô giá trị... Nếu anh em muốn có một tương lai tốt đẹp về tinh thần, hãy nghe theo tôi, đừng bao giờ đọc sách nhảm..."</em></span></div>

                    <div style="text-align: left;"><span style="line-height: 1.42857;">- <em><strong>Jules Payot</strong></em></span></div>
                    <br>
                    <img class="media-object img-responsive" src="images/home/tusach.jpg">
                    <br>            
                    <Strong> Kính thưa Quý độc giả!</Strong>
                    <br>
                    <p>Làm thế nào để có thể chọn được những cuốn <strong> Sách và Văn hóa phẩm </strong>thật hay cho đời sống tinh thần của ta?<p>

                    <p>Bạn có bao giờ mua một cuốn sách theo lời quảng cáo rồi thất vọng vì nội dung hay không?</p>
                    <p>Bạn cảm thấy có quá ít thời gian để xem trước một tác phẩm muốn mua cho bản thân hay đứa con của mình hoặc để tặng bạn bè?</p>
                    <p>Đời sống vật chất ngày càng phát triển tạo ra nhiều tiện nghi đa dạng, thiết thực cho cuộc sống, đồng thời cũng mang lại nhiều hệ lụy về mặt đạo đức, nhiều giá trị văn hóa tinh thần tốt đẹp đang từng ngày bị mai một và mờ nhạt dần. Với thực trạng đó, tâm nguyện của chúng tôi là mong muốn thông qua Sách và Văn hóa phẩm nhằm góp phần bé nhỏ vào một đời sống tinh thần phong phú, lành mạnh của cộng đồng và xã hội. </p>
                    <p>Mong muốn của chúng tôi không chỉ là bán được sách mà quan trọng hơn nữa là phải bán đúng sách.</p>
                    <p> Chúng tôi cam kết chỉ cung cấp những quyển Sách và Văn hóa phẩm thật bổ ích theo đúng định hướng và cũng là con đường chúng tôi đã chọn <strong> “Read & Relax”.</strong></p>
                    <br>
                    <p>Trân trọng!</p>
                    <p>01 - 01 - 2023</p>


                </section>
        <div class="col-sm-8">
            <div class="contact-form">
              
                <p style="font-size: 18px;font-weight: 600">Liên hệ</p>
                <center style="margin-bottom: 15px;"><span class="thongBao"></span></center> 
                <div class="status alert alert-success" style="display: none"></div>
                <div class="fm" style="margin-left: -15px">
                <div>
                    <%
                        m_KHACHHANG kh = (m_KHACHHANG) session.getAttribute("khachHang");
                        if (kh != null) {
                            int syt = c_SACHYEUTHICH.soSachYeuThich(kh.getMaKH());
                    %>
                    <script>
                        $(document).ready(function () {
                            var oo = <%= syt%>;
                            if (oo > 0)
                            {
                                $(".c2").html(oo).show();
                            } else
                            {
                                $(".c2").hide();
                            }
                        });
                    </script>  
                    <div class="form-group col-md-6">
                        <input type="email" class="form-control email-mail" placeholder="Email khách hàng" value="<%= kh.getEmail()%>">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" class="form-control mk_mail" placeholder="Tên khách hàng">
                    </div>
                    <%} else {%>
                    <script>
                        $(document).ready(function () {
                            $(".c2").hide();
                        });
                    </script>  
                    <div class="form-group col-md-6">
                        <input type="email" class="form-control email-mail" placeholder="Email khách hàng">
                    </div>
                    <div class="form-group col-md-6">
                        <input type="text" class="form-control mk_mail" placeholder="Tên khách hàng">
                    </div>
                    <%}%>
                    <div class="form-group col-md-12">
                        <input type="text" name="subject" class="form-control chu_de-mail" required="required" placeholder="Chủ đề">
                    </div>
                    <div class="form-group col-md-12">
                        <textarea id="message" required="required" class="form-control text-mail" rows="8" placeholder="Nội dung"></textarea>
                    </div>                        
                    <div class="form-group col-md-12">
                        <a href="#"><button type="button" class="btn btn-default pull-right gui_mail">gửi</button></a>
                    </div>
                </div>
                </div>
            </div>
        </div>

        <div class="col-sm-4">
            <div class="contact-info">
                <p style="font-size: 18px;font-weight: 600">Địa chỉ</p>
                <address>
                    <p>Nhà sách <strong>Read & Relax</strong></p>
                    <p>Đoàn Tùng - Thanh Miện - Hải Dương</p>
                    <p>Mobile: +84 26 765 923</p>
                    <p>Fax: 1-714-252-0026</p>
                    <p>Email: BookStore@gmail.com</p>
                </address>
                <div class="social-networks">
                  
                    <h1 class="title-pages" style="color: white">Liên kết</h1>
                    <ul>
                        <li>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-youtube"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>  

    </div>	

    <script>
        $(document).ready(function () {
            $(".gui_mail").click(function () {
                var mk = $(".mk_mail").val();
                var email = $(".email-mail").val();
                var text = $(".text-mail").val();
                var oj = $(".chu_de-mail").val();
                if (mk == "" || email == "" || text == "" || oj == "")
                {
                    $('.thongBao').html("Nhập đầy đủ thông tin!").css("color", "#00923f");
                    return;
                } else
                {
                    $('.thongBao').html('<img style="width: 3%;" class="img-responsive" src="images/home/load.gif"/></center>')
                    var ob = {n: "guiMail", mkk: mk, emaill: email, textt: text, ojj: oj};
                    $.ajax({
                        type: "POST",
                        url: "servlet_mail",
                        data: ob,
                        success: function (data) {
                            if (data == 1) {
                                $('.thongBao').html("Email được gửi thành công !").css("color", "#00923f");
                                $(".text-mail").val("");
                                $(".chu_de-mail").val("");
                            } else
                            {
                                $('.thongBao').html("Đang gặp sự cố mạng, vui lòng gửi lại sau !").css("color", "#FE980F");
                            }
                        }
                    });
                }
            });

            $("#40").addClass("menu-act");
            $("#100").removeClass("menu-act");
            $("#20").removeClass("menu-act");
            $("#30").removeClass("menu-act");
        });
    </script>
</div><!--/#contact-page-->