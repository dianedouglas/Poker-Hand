require ('rspec')
require ('poker')

describe ('cardLocation') do
  it("takes a card and returns its location via 2 arrays") do
    cardLocation("2h").should(eq([0,0]))
  end
end

describe ('findHand') do
  it("takes an array of 5 strings, and figures out what hand they correspond to") do
    findHand(["2h", "2c", "2d", "2s", "3h"]).should(eq([[0,0],[0,1],[0,2],[0,3],[1,0]]))
  end
end

describe ("handName") do
  it("takes the findhand locations and returns their word value") do
    handName([[0,0],[2,0],[4,0],[6,0],[8,0]]).should(eq("flush"))
  end
end
