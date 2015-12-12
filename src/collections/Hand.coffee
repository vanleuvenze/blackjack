class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->
    #wheneve this changes, re render the view 

  playerHit: ->
    @add(@deck.pop())
    if (@actualScore(@scores()) > 21)
      alert("Dealer Wins!")
    @last()

  dealerHit: ->
    @add(@deck.pop())
    if (@actualScore(@scores()) > 21)
      alert("Player Wins!")
    @last()
  
  stand: -> 
    @each (card) ->
      card.set 'revealed', true if !card.revealed

    @trigger 'stand', @


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  #if the cards 'revealed' prop is true, add the card's value to the score.  Otherwise add 0 to the score
  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  actualScore: (scores) ->

    if scores[1] <= 21
      return scores[1]
    else
      return scores[0]

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    # alert('you lose') if @minScore() > 21
    #restart the game
    [@minScore(), @minScore() + 10 * @hasAce()]


