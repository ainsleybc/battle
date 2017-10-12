require 'player'

describe Player do
  subject(:player1) { described_class.new('Lucy') }
  let(:player2) { described_class.new("Ainsley") }

  it 'returns its name' do
    expect(player1.name).to eq 'Lucy'
  end

  it 'returns its hit points' do
    expect(player1.hit_points).to eq Player::DEFAULT_HIT_POINTS
  end

  it 'takes a hit' do
    expect{ player1.take_hit }.to change { player1.hit_points }.by -Player::DEFAULT_DAMAGE
  end
end
