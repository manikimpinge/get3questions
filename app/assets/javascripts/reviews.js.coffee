class App.ReviewsForm

  constructor: ->
    @refreshForm()
    @attachChangeListeners()
    @initPlugins()

  refreshForm: ->
    if @isBlankState()
      $('#fb-share-button, .review_contact').hide()
    else
      $('#fb-share-button').toggle(@isSharable())
      $('.review_contact').toggle(!@isSharable())

  attachChangeListeners: ->
    $('.review_recommendation input:radio, .review_score input:radio').change =>
      @refreshForm()

  initPlugins: ->
    $('#review-stars').raty
      width: 150
      targetKeep: true
      targetType: 'number'
      target: '#review_score'
      score: $('#review_score').val()
      number: 5
      click: =>
        @refreshForm()
    $('#review_score').hide()


  isBlankState: ->
    !parseInt($('#review_score').val(), 10) or !$('input[name="review[recommendation]"]').is(':checked')

  isSharable: ->
    $('#review_recommendation_true').is(':checked') and
      parseInt($('#review_score').val(), 10) > 3

$ ->
  if('body.reviews form').length
    new App.ReviewsForm
