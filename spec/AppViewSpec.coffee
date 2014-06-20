assert = chai.assert

describe 'appView', ->
  deck = null
  hand = null
  appView = null

  beforeEach ->
    appView = new AppView()

  describe "New game button", ->
    it "should restart the game", ->
      oldModel = appView.model
      appView.$el.find('.restart-button').trigger('click')
      assert.notEqual(appView.model, oldModel)

  describe 'hit', ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
      hand.playable && (assert.strictEqual deck.last(), hand.hit())
      hand.playable && (assert.strictEqual deck.length, 48)


