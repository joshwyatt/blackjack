class window.Dealer extends Backbone.Model

  initialize: ->

  play: ->
    hand = @get('hand')
    console.log('Dealer is supposed to play')
    hand.at(0).flip()

    score = hand.getOptimalScore()

    while score <= 16
      console.log score
      hand.hit()
      score = hand.getOptimalScore()

    @end()
    console.log "outside #{score}"

  end: ->
    @trigger 'end', @
