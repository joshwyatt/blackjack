class window.PlayerView extends Backbone.View

  initialize: ->
    @model.get('hand').on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html '<h2>You (<span class="score"></span>)</h2>'
    @$('.score').text @model.get('hand').getOptimalScore()
    @$el.append(new HandView(collection: @model.get('hand')).el)

