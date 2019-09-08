$(document).ready(function() {

	$('.input-group').on('click', '.button-plus', function(e) {
		incrementValue(e);
	});

	$('.input-group').on('click', '.button-minus', function(e) {
		decrementValue(e);
	});

	$(document).on('keyup', '#from', function() {
		var pname = $('#from').val();
		$('#from').autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "GetPlaceName",
					type : "GET",
					dataType : "json",
					data : {
						place : pname
					},
					success : function(data) {

						response($.map( data.locations, function( item ) {
							return {
								label : item.name,
								value : item.code,
							}
						}));
					},
					error : function(error) {
						alert('error: ' + error);
					}
				});
			},
			minLength : 2
		});
	});
	
	$(document).on('keyup', '#to', function() {
		var pname = $('#to').val();
		$('#to').autocomplete({
			source : function(request, response) {
				$.ajax({
					url : "GetPlaceName",
					type : "GET",
					dataType : "json",
					data : {
						place : pname
					},
					success : function(data) {

						response($.map( data.locations, function( item ) {
							return {
								label : item.name,
								value : item.code,
							}
						}));
					},
					error : function(error) {
						alert('error: ' + error);
					}
				});
			},
			minLength : 2
		});
	});
	
});	

function incrementValue(e) {
	e.preventDefault();
	var fieldName = $(e.target).data('field');
	var parent = $(e.target).closest('div');
	var currentVal = parseInt(parent.find('input[name=' + fieldName + ']')
			.val(), 10);

	if (!isNaN(currentVal)) {
		parent.find('input[name=' + fieldName + ']').val(currentVal + 1);
	} else {
		parent.find('input[name=' + fieldName + ']').val(0);
	}
}

function decrementValue(e) {
	e.preventDefault();
	var fieldName = $(e.target).data('field');
	var parent = $(e.target).closest('div');
	var currentVal = parseInt(parent.find('input[name=' + fieldName + ']')
			.val(), 10);

	if (!isNaN(currentVal) && currentVal > 0) {
		parent.find('input[name=' + fieldName + ']').val(currentVal - 1);
	} else {
		parent.find('input[name=' + fieldName + ']').val(0);
	}
}