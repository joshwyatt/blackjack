assert = chai.assert

describe "card", ->
  card = null

  beforeEach ->
    card = new Card({})

  describe "initialize", ->
    it "should reveal card", ->
      assert.deepEqual card.get("revealed"), true

  describe "flip", ->
    it "should have a flip method", ->
      assert.deepEqual typeof card.flip, "function"

