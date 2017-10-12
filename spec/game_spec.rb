require 'game'
require 'player'

describe Game do

  subject(:game)  { described_class.new }
  let(:player2)   { Player.new('Lucy')}

  it 'attacks a player' do
    expect(player2).to receive(:take_hit)
    game.attack(player2)
  end
end
