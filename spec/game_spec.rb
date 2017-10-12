require 'game'

describe Game do

  subject(:game)  { described_class.new(player1: player1, player2: player2) }
  let(:player1)   { double :player1 }
  let(:player2)   { double :player2 }

  it 'attacks a player' do
    expect(player2).to receive(:take_hit)
    game.attack(player2)
  end

  describe '#initialize' do

    it 'accepts two player instances' do
      expect(game.player1).to eq player1
      expect(game.player2).to eq player2
    end

  end

end
