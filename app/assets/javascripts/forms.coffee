$(document).on "ajax:beforeSend", "#emails-form", ()->
	$("#email-info").html "Se esta procesando tu petición"
$(document).on "ajax:success", "#emails-form", (e, data, status, xhr)->
	$(this).slideUp()
	$("#email-info").html "Ya estas en la fila de las invitaciones beta"
$(document).on "ajax:error", "#emails-form", (e, data, status, xhr)->
	$("#email-info").html data.responseJSON.email[0]



