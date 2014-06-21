class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if !@isDealer and @scores()[0] > 21
      @trigger('endPlayer', @)
    @.last()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    # hasAce = @reduce (memo, card) ->
    #   memo or card.get('value') is 1
    # , false

    numberOfAces = @reduce (memo, card) ->
      ++memo if card.get('value') is 1
      return memo
    , 0

    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if numberOfAces > 0 then [score, score + 10] else [score]

  endPlayer: ->
    @trigger 'endPlayer', @

  getOptimalScore: ->
    score = @scores()
    if score[1] and score[1] <= 21
      return score[1]
    else
      return score[0]

  dealerPlay: ->
    console.log('Dealer is supposed to play')
    @at(0).flip()

    score = @getOptimalScore()

    while score <= 16
      console.log score
      @hit()
      score = @getOptimalScore()

    @endDealer()
    console.log "outside #{score}"

  endDealer: ->
    @trigger 'endDealer', @
