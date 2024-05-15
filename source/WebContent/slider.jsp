<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<section id="slider"><!--slider-->
   
                <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#slider-carousel" data-slide-to="1"></li>
                        <li data-target="#slider-carousel" data-slide-to="2"></li>
						
                    </ol>

                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="col-sm-12">
                                <center> <a class="n" >  <img class="s1 img-responsive"  src="images/home/g5.jpg" /></a></center>
                            </div>
                        </div>
                      
                  <div class="item">
                            <div class="col-sm-12">
                                <center> <a class="n"> <img class="s3 img-responsive"  src="images/home/s2.jpg" /></a></center>
                            </div>
                        </div>

                        <div class="item">

                            <div class="col-sm-12">
                                <center> <a class="n"> <img class="s4 img-responsive"  src="images/home/s3.png" /></a></center>
                            </div>
                        </div>

                    </div>

                    <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
                </div>

     
</section><!--/slider-->
<script>
    $(document).ready(function () {
        $('.n').click(function () {
            var url, data;
            url = "viewBook.jsp";
            data = {"id": 1, "a": "TheLoai", "page": "1"};
            $("#main_bar").html('<center><img style="width: 5%; margin-top: 30px" class="img-responsive" src="images/home/load.gif"/></center>');
            $("#main_bar").load(url, data);
            $(".img").show();
            $("#slider").hide();
        });
    });

</script>