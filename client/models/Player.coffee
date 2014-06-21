class window.Player extends Backbone.Model

  initialize: ->
    @money = 5

  hit: ->
    @get('hand').hit()
    if @get('hand').scores()[0] > 21
      @end()

  end: ->
    @trigger 'end', @
