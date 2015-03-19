$('#product_question').click(function(){
	var status = "off";
	if(document.getElementById('product_question').checked){
		status = "on"
	}
	$.ajax({
		type:'post',
		url: '/reviews/on_off_product_question',
		data: 'status='+status,
		success: function(response){
			
		}
	})
})


$('#save_product_description').click(function(){
	var label = $('#ques').val();
	var placeholder = $('#placeholder').val();
	var profile_id = $('#profile_id').val()
	$.ajax({
		type:'post',
		url: '/profiles/'+profile_id+'/save_product_question',
		data: 'label='+label+'&placeholder='+placeholder,
		success: function(response){
		}
	})
})

$('#save_page_color').click(function(event){
	event.preventDefault();
	var color = $(".pick-a-color").val();
	var profile_id = $(this).attr('class')
	$.ajax({
		type:'post',
		url: '/profiles/'+profile_id+'/save_page_color',
		data: 'color='+color,
		success: function(response){
		}
	})
})

$('#delete_page_header, #delete_profile_image').click(function(event){
	event.preventDefault();
	var src = $(this)
	var profile_id = $(this).attr('class')
	$.ajax({
		type:'delete',
		url: '/profiles/'+profile_id+'/delete_image',
		data: 'delete_column='+$(this).attr('name'),
		success: function(response){
			$('.current_image').html("You don't have any image uploaded yet.")
		},
		error: function(){
			alert('Sorry, something has gone wrong with response. please try later')
		}
	})
})

$(document).on('click', '.minimize', function(){
	$(".floating_box").addClass('hide');
	$('#3q_logo').removeClass('hide');
	$('#3q_logo').parent().css('height','35px');
})

$(document).on('click', '#3q_logo', function(){
	$(this).addClass('hide');
	$('.floating_box').removeClass('hide');
	$('#3q_logo').parent().css('height','280px');
	$('#myIframe').css('height','44%')
	$('#myIframe').css('width','22%')
})
$('#save_review_name_link').click(function(event){
	event.preventDefault();
	var review_name = $('#review_name').val();
	var review_link = $('#review_link').val();
	var profile_id = $(this).prev().attr('value')
	$.ajax({
		type:'post',
		url: '/profiles/'+profile_id+'/add_review_site',
		data: 'review_name='+review_name+'&review_link='+review_link,
		success: function(response){
			if($('#review_link').val() == "" && $('#review_name').val() == ""){
				$('.review_site_link').html('Add a Review site')
			}
			else{
				$('.review_site_link').html('Edit')
			}
		}
	})
})

$('#review_name_link').click(function(){
	if(document.getElementById('review_name_link').checked){
		$('.review_site_link').show();
	}else{
		$('.review_site_link').hide();
	}
	var status = false;
	if(document.getElementById('review_name_link').checked){
		status = true
	}
	$.ajax({
		type:'post',
		url: '/profiles/follow_up_email',
		data: 'status='+status,
		success: function(response){
			
		}
	})
})

$(document).ready(function(){
	if(document.getElementById('review_name_link') != null){
		if(document.getElementById('review_name_link').checked){
			$('.review_site_link').show();
		}
	}
	if(document.getElementById('display_yelp_score') != null){
		if(document.getElementById('display_yelp_score').checked){
			$('.yelp_score_rating').show();
		}
	}
}); 


$(document).ready(function(){
	if(document.getElementById('foo2') != null){
		$("#foo2").carouFredSel({
		 width: 240,
		 height: 180,
		 items: 1,
		 circular: true,
		 infinite: true,
		 auto  : false,
		 
		 prev  : {   
		    button   : "#foo2_prev",
		    key      : "left"
		 },
		 next  : { 
		    button   : "#foo2_next",
		    key      : "right"
		 },
		 pagination  : "#foo2_pag"
		});
	}


	/* Pricing */
	var details_wrapper = $('.details-wrapper')
	details_wrapper.hide();

	$('.details-toggle').on('click', function(e) {
		e.preventDefault();
		details_wrapper.slideToggle();
	})

	/* File upload */
	$('#save-profile-image').on('click', function(e) {
		e.preventDefault();

		var profile_id = $(this).data('id');
		var url = "/profiles/" + profile_id + "/save_page_header";
		var data = "profile_page_header="



	})


});

$('#resend_review_email').click(function(){
	var status = false;
	if(document.getElementById('resend_review_email').checked){
		status = true
	}
	$.ajax({
		type:'post',
		url: '/profiles/resend_email',
		data: 'status='+status,
		success: function(response){

		}
	})
})

$('#display_yelp_score').click(function(){
	if(document.getElementById('display_yelp_score').checked){
		$('.yelp_score_rating').show();
	}else{
		$('.yelp_score_rating').hide();
	}
	var status = false;
	if(document.getElementById('display_yelp_score').checked){
		status = true
	}
	$.ajax({
		type:'post',
		url: '/profiles/yelp_score',
		data: 'status='+status,
		success: function(response){

		}
	})
})

$('#send_contact_us_query').click(function(event){
	event.preventDefault();
	if($('#contact_form')[0].checkValidity()){
		$.ajax({
			type:'post',
			url: '/static_pages/contact_us_query',
			data: $('#contact_form').serialize(),
			success: function(response){
				$('#feedback_email_address').val('')
				$('#feedback_message').val('')
				$('#send_query').hide();
				$('.modal-backdrop').remove()
				$('#contact_message').modal();
			}
		})
	}else{
		alert('Please enter both the fields');
	}
})

$('#save_yelp_score').click(function(){
	var val = $('#yelp_score_value_status').val()
	$.ajax({
		type:'post',
		url: '/profiles/yelp_score_value',
		data: 'value='+val,
		success: function(response){

		}
	})
})


