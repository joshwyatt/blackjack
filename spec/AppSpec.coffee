assert = chai.assert

describe "app", ->
  app = null

  beforeEach ->
    app = new App()

  describe "initialize", ->
    it "should create an instance with a deck", ->
      assert.deepEqual app.get("deck") instanceof Deck, true
    it "should create an instance with a playerHand", ->
      assert.deepEqual app.get("playerHand") instanceof Hand, true
    it "should create an instance with a dealerHand", ->
      assert.deepEqual app.get("dealerHand") instanceof Hand, true
