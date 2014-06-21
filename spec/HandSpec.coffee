assert = chai.assert

describe 'hand', ->
  deck = null
  dealerHand = null
  playerHand = null

  beforeEach ->
    deck = new Deck()
    dealerHand = new Hand([], deck, true)
    playerHand = new Hand([], deck, false)

  describe "dealerHand", ->
    it "should set deck and isDealer to true on its instances", ->
      assert.deepEqual dealerHand.deck, deck
      assert.deepEqual dealerHand.isDealer, true

  describe "playerHand", ->
    it "should set deck and it should set isDealer to false on its instances", ->
      assert.deepEqual playerHand.deck, deck
      assert.deepEqual playerHand.isDealer, false

  describe "endPlayer function", ->
    it "should trigger the `endPlayer` event", (done) ->
      playerHand.on 'endPlayer', ->
        done()
      playerHand.endPlayer()

  describe "endDealer function", ->
    it "should trigger the `endDealer` event", (done) ->
      dealerHand.on 'endDealer', ->
        done()
      dealerHand.endDealer()

  describe "getOptimalScore function", ->
    it "should exist", ->
      assert.deepEqual typeof playerHand.getOptimalScore, 'function'

  describe "dealerPlay function", ->
    it "should exist", ->
      assert.deepEqual typeof playerHand.dealerPlay, 'function'

  describe "scores function", ->
    it "should exist", ->
      assert.deepEqual typeof playerHand.scores, 'function'
