class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  stand: ->
    console.log "Called stand on playerHand"
    @trigger('stand', @)

  dealerScore: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    score = @scores()
    if score.length is 1
      return score[0]
    if score[1] > 21
      return score[0]
    else
      return score[1]

  dealerPlay: ->
    console.log('Dealer is supposed to play')
    @at(0).flip()

    score = @dealerScore()

    while score <= 16
      console.log score
      @hit()
      score = @dealerScore()

    console.log "outside #{score}"





