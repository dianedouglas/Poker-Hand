def cardLocation card
  cardValue = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k", "a"]
  cardSuit = ["h", "c", "d", "s"]
  cardInput = card.split("")
  cardOutput = []
  cardOutput << cardValue.index(cardInput[0]) << cardSuit.index(cardInput[1])
  cardOutput
end

def findHand cards
  handLocation = []
  cards.each do |card|
    handLocation << cardLocation(card)
  end
  handLocation
end

def handName handLocation
  cardValues = []
  cardSuits = []
  handLocation.each do |cardPair|
    cardValues << cardPair[0]
    cardSuits << cardPair[1]
  end

  handPlay = ""

  cardSuits.each do |cardSuit|
     if cardSuits.count(cardSuit) == 5
      handPlay = "flush"
    end
  end

  handPlay

end
#0 0 0 0 1
handName [[0,0],[2,0],[4,0],[6,0],[8,0]]
