var apply = $(".apply");
var float = $("#float");


apply.mouseover(function () {
    float.fadeIn();
});
apply.mouseout(function () {
    float.fadeOut();
});

$(document).ready(function () {
    for(var i = 0; i < 20; i++) {
        $(".form").append("<a href=''class='test'>测试</a>");
    }
});

$(".play").click(function () {
    var timer = null;

    $(".play").hide();
    $("video")[0].play();
    timer = setInterval(function () {
        if($("video")[0].ended){
            $(".play").show();
            clearInterval(timer);
        }
    },10);
});