require 'game'

describe Game do

  subject(:game)  { described_class.new(player_1: player_1, player_2: player_2) }
  let(:player_1)   { double :player }
  let(:player_2)   { double :player }

  describe '#player_1' do

    it 'has a player 1' do
      expect(game.player_1).to eq player_1
    end

  end

  describe '#player_2' do

    it 'has a player 2' do
      expect(game.player_2).to eq player_2
    end

  end

  describe '#attack' do

    it 'attacks a player' do
      expect(player_2).to receive(:take_hit)
      game.attack(player_2)
    end

  end

  describe '#switch turn' do

    it 'changes players turn' do
      game.switch_turn
      expect(game.attacker).to eq player_2
    end

  end

  describe '#receiver' do

    it 'shows the player who is being attacked' do
      expect(game.receiver).to eq player_2
    end

  end

  describe '#attacker' do

    it 'shows the player who is attacking' do
      expect(game.attacker).to eq player_1
    end

  end

end
