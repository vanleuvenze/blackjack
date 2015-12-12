class window.Card extends Backbone.Model
  initialize: (params) ->
    @set
      revealed: true
      value: if !params.rank or 10 < params.rank then 10 else params.rank
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'king'
        when 1 then 'ace'
        when 11 then 'jack'
        when 12 then 'queen'
        else params.rank
       
    @set  
      imgUrl: @get('rankName') + '-' + @get('suitName') + '.png'
    console.log(@get('imgUrl'));
 


  flip: ->
    @set 'revealed', !@get 'revealed'
    

