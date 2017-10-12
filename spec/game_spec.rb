require 'game'

describe Game do

  subject(:game)  { described_class.new }
  let(:player1)   { double :player1 }
  let(:player2)   { double :player2 }

  it 'attacks a player' do
    expect(player2).to receive(:take_hit)
    game.attack(player2)
  end
end
