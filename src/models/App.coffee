 # TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'stand', @stand, @


  stand: ->  

    dealerHand = @get('dealerHand')
    playerHand = @get('playerHand')

    while dealerHand.scores()[0] < 17 or dealerHand.scores()[1] < 17
      console.log(dealerHand); 
      @get('dealerHand').dealerHit()
    # if dealerHand.scores()[0] > 21
    #   alert ('Player wins!')
    if dealerHand.scores()[0] > playerHand.scores()[0] && dealerHand.scores()[0] <= 21
      alert('Dealer wins!')
    else if dealerHand.scores()[0] == playerHand.scores()[0]
      alert("Pot split!")
    else if dealerHand.scores()[0] < playerHand.scores()[0] && playerHand.scores()[0] <= 21
      alert('Player wins!')
	
    
