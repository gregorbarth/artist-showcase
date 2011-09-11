$(document).ready(function() {
    $('nav').onePageNav({
        currentClass: 'current',
        changeHash: true,
        scrollSpeed: 750
    });

	$("#slider").easySlider({
		auto: true,
		continuous: true,
		numeric: true
	});

});