 # TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'stand', @stand, @


  stand: ->  

    dealerHand = @get('dealerHand').scores()
    playerHand = @get('playerHand').scores()

    while dealerHand[0] < 17 or dealerHand[1] < 17 
      @get('dealerHand').hit()
    if dealerHand[0] > 21
      alert ('Player wins!')
    else if dealerHand[0] > playerHand[0]
      alert('Dealer wins!')
    else if dealerHand[0] == playerHand[0]
      alert("Pot split!")
    else if dealerHand[0] < playerHand[0]
      alert('Player wins!')
	
    
