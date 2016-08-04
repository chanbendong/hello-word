if(window.attachEvent)
{
    window.attachEvent("load", function () {
        $("#tab-army").hide();
        $("#tab-img").hide();
        $("#tab-hd").children("").eq(0).css({"background-color":"red"});
    })
}
else
{
    window.addEventListener("load", function () {
        $("#tab-army").hide();
        $("#tab-img").hide();
        $("#tab-hd").children("").eq(0).css({"background-color":"red"});
    })
}

$(document).ready(function () {
    for(var i = 0; i < 10; i++) {
        $("#tab-img").children().append("<a href='' class='tabImg'></a>");
    }
});


$("#tab-hd").children().eq(0).mouseover(function () {
    $("#tab-army").hide();
    $("#tab-img").hide();
    $("#tab-news").show();
    $("#tab-hd").children().eq(0).css({"background-color":"red"});
    $("#tab-hd").children().eq(1).css({"background-color":"white"});
    $("#tab-hd").children().eq(2).css({"background-color":"white"});
});
$("#tab-hd").children().eq(1).mouseover(function () {
    $("#tab-army").hide();
    $("#tab-img").show();
    $("#tab-news").hide();
    $("#tab-hd").children().eq(1).css({"background-color":"red"});
    $("#tab-hd").children().eq(0).css({"background-color":"white"});
    $("#tab-hd").children().eq(2).css({"background-color":"white"});
});

$("#tab-hd").children().eq(2).mouseover(function () {
    $("#tab-army").show();
    $("#tab-img").hide();
    $("#tab-news").hide();
    $("#tab-hd").children().eq(2).css({"background-color":"red"});
    $("#tab-hd").children().eq(1).css({"background-color":"white"});
    $("#tab-hd").children().eq(0).css({"background-color":"white"});
});