class App.InvitationsForm
  constructor: ->
    @attachChangeListeners()
    @refreshForm()

  attachChangeListeners: =>
    $('#invitation_medium').on 'change', =>
      @refreshForm()

  refreshForm: =>
    $('.invitation_phone, .invitation_email').hide()
    medium = $('#invitation_medium').val()
    $(".invitation_#{medium}").show()

$ ->
  if('body.invitations form').length
    new App.InvitationsForm
