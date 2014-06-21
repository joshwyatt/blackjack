class window.CardView extends Backbone.View

  className: 'card'
  tagName: 'img'

  # template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    # @$el.html @template @model.attributes
    rank = @model.get('rankName').toString().toLowerCase()
    suit = @model.get('suitName').toLowerCase()
    @$el.attr('src', "img/cards/#{rank}-#{suit}.png")
    @$el.addClass 'covered' unless @model.get 'revealed'
