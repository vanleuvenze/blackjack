class window.CardView extends Backbone.View
  className: 'card'
  template: (model) -> 
    if model.revealed
      '<img src = img/cards/' + model.imgUrl + '>'
    else 
      '<img src = img/card-back.png >'

  initialize: -> 
    # @model.on 'change:revealed', @render, @
  	@render()
  	
  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

