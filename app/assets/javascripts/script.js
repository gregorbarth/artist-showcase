$(document).ready(function() {
    $("nav").onePageNav({
        currentClass: "current",
        changeHash: true,
        scrollSpeed: 750
    });

	$("#slider").easySlider({
		auto: true,
		continuous: true,
		numeric: true
	});

    $("#listen article ul li").first().show();

    $("#listen aside ul li a").click(function() {
        var articles = $("#listen article ul li");
        articles.hide("slow");
        articles.filter("."+$(this).attr("class")).show("slow");
        return false
    });

    $("footer a.about_asc_trigger").click(function() {
        $("#about_asc").toggle();
        return false
    });

});