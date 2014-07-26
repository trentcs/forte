$(function(){
	console.log("Page load users js")
	$("#signupform").submit(function(e){
		e.preventDefault();
		var formData = $(this).serialize();
		$.ajax({
			type: "post",
			url: "/users",
			data: formData,
			success: function(response){
				console.log("response is " + response.redirect);
				window.location.replace(response.redirect);
			},
			error: function(response){
				$(".signup_errors").empty();
				var errors = $.parseJSON(response.responseText).errors
				console.log(errors);
				for(i = 0; i < errors.length; i++){
					$(".signup_errors").append("<li> " + errors[i] + "</li>");
				};
			}
		});
	});
});