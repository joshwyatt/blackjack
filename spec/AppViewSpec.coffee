assert = chai.assert

describe "appView", ->
  deck = null
  hand = null
  appView = null

  beforeEach ->
    appView = new AppView()

  describe "New game button", ->
    it "should restart the game", ->
      oldModel = appView.model
      appView.$el.find(".restart-button").trigger("click")
      assert.notEqual(appView.model, oldModel)

  describe "status", ->
    it "should display the game result status", ->
      appView.model.get("dealerHand").trigger("endDealer")
      assert.deepEqual appView.$(".status").length, 1

  describe "render", ->
    it "should render two containers: 'playerHand' and 'dealerHand'", ->
      assert.deepEqual appView.$('.player-hand-container').length, 1
      assert.deepEqual appView.$('.dealer-hand-container').length, 1

  describe "stand button", ->
    it "should disable stand button after first click", ->
      $standButton = appView.$(".stand-button")
      $standButton.click()
      assert.deepEqual $standButton.attr("disabled"), "disabled"

