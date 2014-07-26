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
				window.location.href = response.redirect;
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

	$("#editform").submit(function(e){
		e.preventDefault();
		console.log("in the edit form call")
		var formData = $(this).serialize();
		var edit_url = "/users/" + $("#user_id").val();
		console.log("edit url is " + edit_url)
		$.ajax({
			type: "put",
			url: edit_url ,
			data: formData,
			success: function(response){
				console.log("Response is " + response.redirect);
				window.location.href = response.redirect;
			},
			error: function(response){
				console.log("error");
				$(".edit_errors").empty();
				var errors = $.parseJSON(response.responseText).errors
				console.log(errors);
				for(i = 0; i < errors.length; i++){
					$(".edit_errors").append("<li> " + errors[i] + "</li>");
				};
			}
		});
	});
});