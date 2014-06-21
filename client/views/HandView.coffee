class window.HandView extends Backbone.View

  className: 'hand'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
