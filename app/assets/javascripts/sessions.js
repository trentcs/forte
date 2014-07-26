$(function(){
	console.log("sessions.js loaded on page load")

	$("#loginform").submit(function(e){
		e.preventDefault();
		console.log("in the log in submit action");
		var formData = $(this).serialize();

		$.ajax({
			type: "post",
			url: "/session",
			data: formData,
			success: function(response){console.log("success received is " + response.redirect)},
			error: function(response){
				$(".login_errors > li").text("Email or password is incorrect.")
			}
		});
	});
});