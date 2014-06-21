#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    deck = new Deck()
    @set 'deck', deck
    @set 'player', new Player()
    @set 'dealer', new Dealer()
    @get('player').set 'hand', deck.dealPlayer()
    @get('dealer').set 'hand', deck.dealDealer()
