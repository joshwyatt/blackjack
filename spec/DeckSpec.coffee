assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe "deck constructor", ->
    it "should create a card collection", ->
      assert.strictEqual new Deck().length, 52

  describe 'hit', ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
      hand.playable && (assert.strictEqual deck.last(), hand.hit())
      hand.playable && (assert.strictEqual deck.length, 48)


