 # TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on 'stand', @stand, @


  stand: ->  
    console.log('crap')
    while @get('dealerHand').scores()[0] < 17
      @get('dealerHand').hit()
    if @get('dealerHand').scores()[0] > 21
      alert ('Player wins!')
    else if @get('dealerHand').scores()[0] > @get('playerHand').scores()[0]
      alert('Dealer wins!')
    else if @get('dealerHand').scores()[0] == @get('playerHand').scores()[0]
      alert("Pot split!")
    else if @get('dealerHand').scores()[0] < @get('playerHand').scores()[0]
      alert('Player wins!')
	
    
