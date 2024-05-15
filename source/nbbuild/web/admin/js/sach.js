
$(document).ready(function () {

 $("#4, .nam, .slt, .st, .gbi, .km,.gb").keydown(function (event) {

            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9
                    || event.keyCode == 27 || event.keyCode == 13
                    || (event.keyCode == 65 && event.ctrlKey === true)
                    || (event.keyCode >= 35 && event.keyCode <= 39)) {
                return;
            } else {
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });
        
    $('.sua').click(function (event)
    {
        var i = $(".ma").html();
        var j = $(this).html();
        if(j == "sửa")
        {
        $(this).html("lưu");

        $(".ten").attr("disabled", false);
        $(".tg_doi").show();
        $(".tg_").hide();
        $(".tl_doi").show();
        $(".tl_").hide();
        $(".nxb_doi").show();
        $(".nxb_").hide();

        $(".nam").attr("disabled", false);
        $(".slt").attr("disabled", false);
        $(".st").attr("disabled", false);
        $(".kl").attr("disabled", false);
        $(".nn").attr("disabled", false);
        $(".gbi").attr("disabled", false);
        $(".km").attr("disabled", false);
        $(".gb").attr("disabled", false);
        $(".la").attr("disabled", false);
        $(".tt").attr("disabled", false);
        $(".huy").show();   
            
    }
    else
    {
            var v3 =  $(".st").val();
            var v4 = $.trim($(".ten").val());
            var v5 = $(".nam").val();
            var v6 = $(".slt").val();
            var v7 = $(".kl").val();
            var v8 = $.trim($(".nn").val());
            var v9 = $(".gbi").val();
            var v10 = $(".km").val();
            var v14 = $(".la").val();
            var v15 = $(".tt").val();
          
    if (v3 == "" || v4 == "" || v5 == "" || v6 == "" || v7 == "" || v8 == "" || v9 == "" || v10 == "" || v14 == "" || v15 == "")
            {
                alert("Nhập đầy đủ thông tin");
                return;
            } else
            {
                var ob = {
                    n: "sua",
                    ma: i,
                    ten_them: v4,
                    namxb_them: v5,
                    sl_them: v6,
                    st_them: v3,
                    nn_them: v8,
                    tt_them: v15,
                    gbia_them: v9,
                    km_them: v10,
                    la_them: v14,
                    kl_them: v7
                };
                $.ajax({
                    type: "POST", // phương thức gởi đi
                    url: "../servlet_sach", // nơi mà dữ liệu sẽ chuyển đến khi submit
                    data: ob,
                    success: function (data) { // if everything goes well
                        if (data == 1)
                        {
                            alert("Sửa thành công !");
                            $('.close').click();
                        } else
                        {
                            alert("Thất bại");
                        }
                    }
                });
            }
    }
    });
    
     $('.huy').click(function (event){
         
         $(".ten").attr("disabled", true);
        $(".tg_doi").hide();
        $(".tg_").show();
        $(".tl_doi").hide();
        $(".tl_").show();
        $(".nxb_doi").hide();
        $(".nxb_").show();

        $(".nam").attr("disabled", true);
        $(".slt").attr("disabled", true);
        $(".st").attr("disabled", true);
        $(".kl").attr("disabled", true);
        $(".nn").attr("disabled", true);
        $(".gbi").attr("disabled", true);
        $(".km").attr("disabled", true);
        $(".gb").attr("disabled", true);
        $(".d").attr("disabled", true);
        $(".la").attr("disabled", true);
        $(".tt").attr("disabled", true);
         $(".sua").html("sửa");
        $(this).hide();
     });

});


