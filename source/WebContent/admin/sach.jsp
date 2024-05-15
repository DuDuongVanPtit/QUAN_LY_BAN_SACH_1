
<%@page import="model.c_THELOAI"%>
<%@page import="model.c_TACGIA"%>
<%@page import="model.c_NXB"%>
<%@page import="model.c_SACH"%>
<%@page import="model.m_SACH"%>
<%@page import="model.m_NXB"%>
<%@page import="model.m_TACGIA"%>
<%@page import="java.util.List"%>
<%@page import="model.m_THELOAI"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sach</title>
        <script src="js/jquery.js"></script>
        <script src="js/sach.js"></script>
         <meta charset="UTF-8">
        <style>
            td>input{ padding: 10px;}
            td>p{padding-left: 10px;}
        </style>
    </head>
    <body>
        <div id="sach">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            SÁCH
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i><a>Bảng</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-edit"></i> Danh sách
                            </li>
                            <a href="#" class="rf pull-right">Tải lại trang</a>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover xem">
                                <thead>
                                    <tr>                                  
                                        <th>Mã sách</th>
                                        <th>Mã thể loại</th>
                                        <th>Tên sách</th>
                                        <th>SL tồn</th>
                                        <th>Mã tác giả</th>
                                        <th>Năm XB</th>
                                        <th>Ngôn ngữ</th>
                                        <th>Gía bìa</th>
                                        <th>Khuyến mãi</th>
                                        <th>Gía bán</th>
                                        <th>Điểm</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<m_SACH> list5 = c_SACH.getlistSachMoiNhat(0, 10);
                                        for (m_SACH m : list5) {
                                    %>
                                    <tr>
                                        <td><%=m.getMaSach()%></td>
                                        <td><%=m.getMaTheLoai()%></td>
                                        <td><%=m.getTenSach()%></td>
                                        <td><%=m.getSoLuongTon()%></td>
                                        <td><%=m.getMaTacGia()%></td>
                                        <td><%=m.getNamXuatBan()%></td>
                                        <td><%=m.getNgonNgu()%></td>
                                        <td><%=m.getGiaBia()%> đ</td>
                                        <td><%=m.getKhuyenMai()%>%</td>
                                        <td><%=m.getGiaBan()%> đ</td>
                                        <td><%=m.getDiem()%></td> 
                                        <td><a href="#" class="ct" name="<%=m.getMaSach()%>" style="color: #3b5998;" data-toggle="modal" data-target="#chitiet">chi tiết</a></td>
                                    </tr>     
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                        <button type="button" class="btn btn-default pull-right xem_them">Xem thêm</button>
                    </div>
                </div>
            </div>
            <b><div class="tenbang">THÊM MỚI</div></b>
            <div class="row">


                <div class="col-lg-6" style="margin-top: 60px;">

                    <div class="row">
                        <div class="col-lg-3">
                            <p>Tên sách :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input class="form-control ten_them"><span class="mes_them"></span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-3">
                            <p>Năm xuất bản :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input type="number" class="form-control namxb_them">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <p>Số lượng :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input type="number" class="form-control sl_them" min="1">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <p>Số trang :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input type="number" class="form-control st_them" min="1" >
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <p>Khối lượng:</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input class="form-control kl_them">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <p>Ngôn ngữ :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input class="form-control nn_them">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <p>Gía bìa :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input type="number" class="form-control gbia_them" min="1">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <p>Khuyến mãi :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input type="number" class="form-control km_them" min="1" >
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <p>Link ảnh :</p>
                        </div>
                        <div class="col-lg-8">                     
                            <input class="form-control la_them" placeholder="">
                        </div>
                    </div>

                </div>

                <div class="col-lg-6">
                    <div class="form-group row" style="margin-top: 60px;">
                        <div class="col-lg-3">
                            <P>Thể loại : </P>
                        </div>
                        <div class="col-lg-8">
                            <select class="form-control tl_them">
                                <option></option>
                                <%
                                    List<m_THELOAI> list = c_THELOAI.getlist();
                                    for (m_THELOAI n : list) {
                                %>
                                <option><%= n.getTenTheLoai()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>


                    <div class="form-group row" style="margin-top: 30px;">
                        <div class="col-lg-3">
                            <p>Tác giả : </p>
                        </div>
                        <div class="col-lg-8">
                            <select class="form-control tg_them">
                                <option></option>
                                <%
                                    List<m_TACGIA> list1 = c_TACGIA.getlist();
                                    for (m_TACGIA n1 : list1) {
                                %>
                                <option><%= n1.getTenTacGia()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row" style="margin-top: 30px; margin-bottom: 30px">
                        <div class="col-lg-3">
                            <p>Nhà xuất bản :</p>
                        </div>
                        <div class="col-lg-8">
                            <select class="form-control nxb_them">
                                <option></option>
                                <%
                                    List<m_NXB> list2 = c_NXB.getlist();
                                    for (m_NXB n2 : list2) {
                                %>
                                <option><%= n2.getTenNXB()%></option>
                                <%}%>
                            </select>
                        </div>    
                    </div>

                    <div class="row">
                        <div class="col-lg-3">
                            <p>Tóm tắt</p>
                        </div>
                        <div class="col-lg-8">
                            <textarea class="form-control tt_them" rows="3" placeholder="" style="height:90px"></textarea>
                        </div>    
                    </div>
                    <button type="submit" class="btn btn-default pull-left" id ="them">Thêm</button>
                </div>

            </div>
            <div class="modal fade" id="chitiet" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="padding: 10px 20px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" style="margin-bottom: 20px">XEM CHI TIẾT</h4>
                            <table class="table table-hover t" style="background-color: rgba(228, 228, 228, 0.13);">
                                <tr>
                                    <td>Mã sách :</td>
                                    <td> <p class="ma"></p></td>
                                </tr>
                                <tr>
                                    <td>Tên sách :</td>
                                    <td> <input disabled class="ten" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Mã tác giả:</td>
                                    <td style="display: none" class="tg_doi" ><div class="form-group">
                                            <select class="form-control" class="tg_doi">
                                                <%
                                                    List<m_TACGIA> listbb = c_TACGIA.getlist();
                                                    for (m_TACGIA nb : listbb) {
                                                %>
                                                <option ><%= nb.getTenTacGia()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </td>
                                    <td class="tg_"><p class="tg"></p> </td>
                                </tr>
                                <tr>
                                    <td>Mã thể loại :</td>
                                    <td style="display: none" class="tl_doi">
                                        <div class="form-group">
                                            <select class="form-control" class="tl_doi">
                                                <%
                                                    List<m_THELOAI> listaa = c_THELOAI.getlist();
                                                    for (m_THELOAI na : listaa) {
                                                %>
                                                <option ><%= na.getTenTheLoai()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </td>
                                    <td class="tl_"><p class="tl"></p></td>
                                </tr>
                                <tr>
                                    <td>Mã nhà xuất bản :</td>
                                    <td style="display: none" class="nxb_doi"><div class="form-group">
                                            <select class="form-control" class="nxb_doi">
                                                <%
                                                    List<m_NXB> listcc = c_NXB.getlist();
                                                    for (m_NXB nc : listcc) {
                                                %>
                                                <option ><%= nc.getTenNXB()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </td>
                                    <td class="nxb_"><p class="nxb"></p> </td>
                                </tr>

                                <tr>
                                    <td>Năm xuất bản :</td>
                                    <td> <input disabled class="nam" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Số lượng tồn :</td>
                                    <td> <input disabled class="slt" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Số trang :</td>
                                    <td> <input disabled class="st" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Khối lượng :</td>
                                    <td> <input disabled class="kl" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Ngôn ngữ :</td>
                                    <td> <input disabled class="nn" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Gía bìa :</td>
                                    <td> <input disabled class="gbi" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Khuyến mãi:</td>
                                    <td> <input disabled class="km" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Gía bán :</td>
                                    <td> <input disabled class="gb" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Điểm :</td>
                                    <td> <input disabled class="d" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>
                                <tr>
                                    <td>Link ảnh :</td>
                                    <td> <input disabled class="la" style="width:100%; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D;"/></td>
                                </tr>  
                                <tr>
                                    <td>Tóm tắt:</td>
                                    <td><textarea class="tt" disabled style="width:100%; height: 150px; display: inline; margin-right: 20px;border:none; border-bottom: 1px dotted #987D7D"></textarea></td>
                                </tr>
                                <tr>
                                  
                                     <td></td>
                                    <td class="mo pull-right"><a href=# style="display: inline;margin-left: 15px; display: none" class="huy">hủy</a><a href=# style="display: inline; margin-right: 20px; margin-left: 15px" class="sua">sửa</a><a href=# style="display: inline" class="xoa">xóa</a></td>
                                </tr>
                            </table>  
                        </div>
                        <div class="modal-body">
                        </div>

                    </div>
                </div>
            </div>
    </body>
</html>
<script>

    $(document).ready(function () {
        var pageg = 1;
        $('#them').click(function (event)
        {
            var v1 = $(".tl_them").val();
            var v2 = $(".tg_them").val();
            var v3 = $(".nxb_them").val();
            var v4 = $.trim($(".ten_them").val());
            var v5 = $(".namxb_them").val();
            var v6 = $(".sl_them").val();
            var v7 = $(".st_them").val();
            var v8 = $.trim($(".nn_them").val());
            var v9 = $(".tt_them").val();
            var v10 = $(".gbia_them").val();
            var v11 = $(".km_them").val();
            var v14 = $(".la_them").val();
            var v15 = $(".kl_them").val();
            if (v1 == "" || v2 == "" || v3 == "" || v4 == "" || v5 == "" || v6 == "" || v7 == "" || v8 == "" || v9 == "" || v10 == "" || v11 == "" || v14 == "" || v15 == "")
            {
                alert("Nhập đầy đủ thông tin");
                return;
            } else
            {
                var ob = {
                    n: "them",
                    tl_them: v1,
                    tg_them: v2,
                    nxb_them: v3,
                    ten_them: v4,
                    namxb_them: v5,
                    sl_them: v6,
                    st_them: v7,
                    nn_them: v8,
                    tt_them: v9,
                    gbia_them: v10,
                    km_them: v11,
                    la_them: v14,
                    kl_them: v15
                };
                $.ajax({
                    type: "POST", // phương thức gởi đi
                    url: "../servlet_sach", // nơi mà dữ liệu sẽ chuyển đến khi submit
                    data: ob,
                    success: function (data) { // if everything goes well
                        if (data == 1)
                        {
                            $('.rf').click();
                        } else
                        {
                            alert("Thất bại");
                        }
                    }
                });
            }
        });

        $('.xoa').click(function (event) {
            var v = $(".ma").html();
            var k = confirm("Bạn có chắc chắn muốn xóa không?");
            if (k == true)
            {
                var ob = {
                    ma: v,
                    n: "xoaSach"};
                $.ajax({
                    type: "POST",
                    url: "../servlet_sach",
                    data: ob,
                    success: function (data) {
                        if (data == 1)
                        {
                            $('.close').click();
                        } else
                        {
                            alert("Không thể xóa!");
                        }
                    }
                });
            } else {

            }
        });

        $('.ct').click(function (event)
        {
            var i = $(this).attr('name');

            var ob = {n: "timTheoMa", ma: i};
            $.ajax({
                type: "GET",
                url: "../servlet_sach",
                data: ob,
                dataType: "json",
                success: function (data) {

                    $(".ma").html(data["MaSach"]);
                    $(".ten").val(data["TenSach"]);
                    $(".tg").html(data["MaTacGia"]);
                    $(".tl").html(data["MaTheLoai"]);
                    $(".nxb").html(data["MaNXB"]);
                    $(".nam").val(data["NamXuatBan"]);
                    $(".slt").val(data["SoLuongTon"]);
                    $(".st").val(data["SoTrang"]);
                    $(".kl").val(data["KhoiLuong"]);
                    $(".nn").val(data["NgonNgu"]);
                    $(".gbi").val(data["GiaBia"]);
                    $(".km").val(data["KhuyenMai"]);
                    $(".gb").val(data["GiaBan"]);
                    $(".d").val(data["Diem"]);
                    $(".la").val(data["LinkAnh"]);
                    $(".tt").val(data["TomTat"]);
                }
            });
        });

        $('.rf').click(function () {
            $("#page-wrapper").html('<center><img style="width: 3%; margin-top: 30px; margin-bottom: 700px;" class="img-responsive" src="/images/home/load.gif"/></center>');
            $("#page-wrapper").load("sach.jsp");
        });

        $('.xem_them').click(function () {
            var ob = {
                page: pageg,
                n: "xemThemSach"
            };
            $.ajax({
                type: "GET",
                url: "../servlet_XemThem",
                data: ob,
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, data) {
                        var html = '';
                        html += "<tr><td>" + data["MaSach"] + "</td>";
                        html += "<td>" + data["MaTheLoai"] + "</td>";
                        html += "<td>" + data["TenSach"] + "</td>";
                        html += "<td>" + data["MaNXB"] + "</td>";
                        html += "<td>" + data["MaTacGia"] + "</td>";
                        html += "<td>" + data["NamXuatBan"] + "</td>";
                        html += "<td>" + data["NgonNgu"] + "</td>";
                        html += "<td>" + data["GiaBia"] + " đ</td>";
                        html += "<td>" + data["KhuyenMai"] + "</td>";
                        html += "<td>" + data["GiaBan"] + "đ </td>";
                        html += "<td>" + data["Diem"] + "</td>";
                        html += '<td><a href="#" class="ct" name="' + data["MaSach"] + '" style="color: #3b5998;" data-toggle="modal" data-target="#chitiet">chi tiết</a></td></tr>';
                        $('.xem').append(html);
                    });
                }
            });
            pageg++;
        });

        
    });
</script>