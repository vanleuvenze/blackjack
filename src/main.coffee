newDeck = new Deck ()
playerHand = newDeck.dealPlayer()
dealerHand = newDeck.dealPlayer()
new AppView(model: new App()).$el.appendTo 'body'
