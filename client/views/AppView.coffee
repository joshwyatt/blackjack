class window.AppView extends Backbone.View

  template: _.template '
    <div class="status"></div>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="restart-button">New game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').endPlayer()
    "click .restart-button": ->
      @reset()

  # Only to be called the very first game
  initialize: ->
    @reset()

  # Call this to start a new game after the very first
  reset: ->
    @model = new App()

    @model.get('playerHand').once 'endPlayer', =>
      @$('.hit-button').attr('disabled', 'disabled');
      @$('.stand-button').attr('disabled', 'disabled');
      @model.get('dealerHand').dealerPlay()

    @model.get('dealerHand').on 'endDealer', =>
      playerScore = @model.get('playerHand').getOptimalScore()
      dealerScore = @model.get('dealerHand').getOptimalScore()

      if (playerScore > 21) or (dealerScore > playerScore and dealerScore <= 21)
        @$('.status').text('Dealer wins.');
      else if dealerScore > 21 or playerScore > dealerScore
        @$('.status').text('Player wins.');
      else
        @$('.status').text('Push.');

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
