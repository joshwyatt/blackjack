class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if !@isDealer
      @add(@deck.pop()).last()
    else
      console.log "I am the dealer."

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
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  dealerPlay: ->
    console.log('Dealer is supposed to play')
    @at(0).flip()

    # scores = @scores()
    # if scores.length is 1
    #   score = scores[0]
    # else if scores[1] > 21
    #   score = scores[0]
    # else
    #   score = scores[1]


    # score = @scores()[0]

    # while score <= 16
    #   console.log score
    #   scores = @scores()
    #   if scores.length is 1
    #     score = scores[0]
    #   else if scores[1] > 21
    #     score = scores[0]
    #   else
    #     score = scores[1]
    #   @hit()

    # console.log score
    # console.log scores




