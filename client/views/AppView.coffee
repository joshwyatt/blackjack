class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="restart-button">New game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').endPlayer()
    "click .restart-button": ->
      @reset()

  initialize: ->
    @reset()

  reset: ->
    @model = new App()
    @model.get('playerHand').once 'endPlayer', =>
      @$('.hit-button').attr('disabled', true);
      @$('.stand-button').attr('disabled', true);
      @model.get('dealerHand').dealerPlay()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
