$(document).ready(function(){
	$(".new-show-form").validate({
		debug: true,
		rules: {
			"show[name]": {required:true},
			"show[start_time]": {required:true},
			"show[end_time]": {required:true},
			"show[day_of_week]": {required:true}
		}
	});
});