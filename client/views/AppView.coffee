class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button button glow">Hit</button> <button class="stand-button button glow">Stand</button> <button class="restart-button button glow">New game</button>
    <div class="player-container"></div>
    <div class="dealer-container"></div>
    <h2 class="status"></h2>
  '

  events:
    "click .hit-button": -> @model.get('player').hit()
    "click .stand-button": -> @model.get('player').end()
    "click .restart-button": ->
      @reset()

  # Only to be called the very first game
  initialize: ->
    @reset()

  # Call this to start a new game after the very first
  reset: ->
    @model = new App()

    @model.get('player').once 'end', =>
      @$('.hit-button').attr('disabled', 'disabled')
      @$('.stand-button').attr('disabled', 'disabled')
      @model.get('dealer').play()

    @model.get('dealer').on 'end', =>
      playerScore = @model.get('player').get('hand').getOptimalScore()
      dealerScore = @model.get('dealer').get('hand').getOptimalScore()

      if (playerScore > 21) or (dealerScore > playerScore and dealerScore <= 21)
        @$('.status').text('Dealer wins.')
      else if dealerScore > 21 or playerScore > dealerScore
        @$('.status').text('Player wins.')
      else
        @$('.status').text('Push.')

    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-container').html new PlayerView(model: @model.get 'player').el
    @$('.dealer-container').html new DealerView(model: @model.get 'dealer').el
