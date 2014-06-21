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

  describe "hit", ->
    it "should give the last card from the deck", ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49
      hand.playable && (assert.strictEqual deck.last(), hand.hit())
      hand.playable && (assert.strictEqual deck.length, 48)

  describe "dealPlayer", ->
    it "should be a method of the returned deck instance", ->
      assert.strictEqual typeof deck.dealPlayer, 'function'
    it "should return a hand", ->
      assert.deepEqual deck.dealPlayer() instanceof Hand, true

  describe "dealDealer", ->
    it "should be a method of the returned deck instance", ->
      assert.strictEqual typeof deck.dealDealer, 'function'
    it "should return a hand", ->
      assert.deepEqual deck.dealDealer() instanceof Hand, true



