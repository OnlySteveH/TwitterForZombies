# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$('show-bio').click(event) ->
		event.preventDefault()
		$(this).hide()
		$('.field#bio').show()

	$('div#custom_phase2 form').submit(event) ->
    event.preventDefault()
    url = $(this).attr('action')
    custom_decomp = $('div#custom_phase2 #decomp').val()

    $.ajax
      type: 'patch'
      url: url
      data: { zombie: { decomp: custom_decomp } }
      dataType: 'json' 
      success: (json) ->
        $('#decomp').text(json.decomp).effect('highlight')
        $('div#custom_phase2').fadeOut() if json.decomp == "Dead (again)"
		