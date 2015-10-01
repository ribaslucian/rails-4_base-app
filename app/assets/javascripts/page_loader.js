$(document).keydown(function(e) {
	if (e.which == 116)
		$('.j_page_loader').fadeIn('fast');
});

// Ao alterar de página mostrar loader
$(document).on("page:before-change", function() {
	$('.j_page_loader').fadeIn('fast');
});

// Ao carregar de página esconder loader
$('.j_page_loader').fadeOut('medium');
