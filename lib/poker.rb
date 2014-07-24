def cardLocation card
  cardValue = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "j", "q", "k", "a"]
  cardSuit = ["h", "c", "d", "s"]
  cardOutput = []
  cardInput = []

  cardInput[1] = card.slice(-1)
  card.slice!(-1)
  cardInput[0] = card
  cardOutput << cardValue.index(cardInput[0]) << cardSuit.index(cardInput[1])
  cardOutput
end

def findHand cards
  handLocation = []
  cards.each do |card|
    handLocation << cardLocation(card)
  end
  handName(handLocation)
end

def handName handLocation
  cardValues = []
  cardSuits = []
  handLocation.each do |cardPair|
    cardValues << cardPair[0]
    cardSuits << cardPair[1]
  end

  handPlay = ""
  handFlush = ""
  cardValues.each do |cardValue|
    if cardValues.count(cardValue) == 4
      handPlay = "four of a kind"
    elsif cardValues.count(cardValue) == 3
      leftovers = cardValues
      leftovers.delete(cardValue)
      if leftovers[0] == leftovers[1]
        handPlay = "fullhouse"
        break
      else
        handPlay = "three of a kind"
        break
      end
    elsif cardValues.count(cardValue) == 2
      leftovers = cardValues
      leftovers.delete(cardValue)
      if leftovers[0] == leftovers[1] || leftovers[0] == leftovers[2] || leftovers[1] == leftovers[2]
        handPlay = "two pair"
        break
      else
        handPlay = "pair"
      end
    else
      cardValues.sort!
      if cardValues[0] == cardValues[1]-1 && cardValues[1] == cardValues[2]-1 && cardValues[2] == cardValues[3]-1 && cardValues[3] == cardValues[4]-1
        handPlay = "straight"
        if cardValues[0] == 8
          handPlay = "royal straight"
        end
      end
    end
  end

  cardSuits.each do |cardSuit|
     if cardSuits.count(cardSuit) == 5
      handFlush = "flush"
    end
  end

puts handPlay + handFlush
handPlay + handFlush

end
#0 0 0 0 1
findHand ["10h" , "jh" , "qh" , "kh" , "ah"]


