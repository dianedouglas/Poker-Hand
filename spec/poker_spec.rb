require ('rspec')
require ('poker')

# describe 'poker_hand' do
#   it 'can detect a single pair' do
#     poker_hand(["2s", "5s", "7s", "9s", "js"]).should(eq('flush'))
#   end
# end

describe ('cardLocation') do
  it("takes a card and returns its location via 2 arrays") do
    cardLocation("10h").should(eq([8,0]))
  end
end

describe ('findHand') do
  it("takes an array of 5 strings, and figures out what hand they correspond to") do
    findHand(["2h", "2c", "2d", "2s", "3h"]).should(eq([[0,0],[0,1],[0,2],[0,3],[1,0]]))
  end
end

describe ("handName") do
  it("takes the findhand locations and returns their word value for a flush") do
    handName([[0,0],[2,0],[4,0],[6,0],[8,0]]).should(eq("flush"))
  end
  it("takes the findhand locations and returns their word value for four/three/pair of a kind") do
    handName([[0,0],[0,1],[0,2],[0,3],[1,0]]).should(eq("four of a kind"))
  end
  it("takes the findHand locations and returns full house if there is both 3 of a kind and a pair") do
    handName([[0,0],[0,1],[0,2],[1,3],[1,0]]).should(eq("fullhouse"))
  end
  it("takes the findHand locations and returns two pair if there is more than one pair, and not a full house") do
    handName([[0,0],[0,1],[1,2],[1,3],[3,0]]).should(eq("two pair"))
  end
  it("takes the findhand locations and returns striaght if all values are in sequential order") do
    handName([[0,0],[1,1],[2,2],[3,3],[4,0]]).should(eq("straight"))
  end
  it("takes the findhand locations and returns striaghtflush if all values are in sequential order and of the same suit") do
    handName([[0,0],[1,0],[2,0],[3,0],[4,0]]).should(eq("straightflush"))
  end
end
