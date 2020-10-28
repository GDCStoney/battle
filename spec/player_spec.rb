require 'player'

describe Player do
  subject(:dave) { Player.new('Dave') }
  subject(:jane) { Player.new('Jane') }

  describe '#name' do
    it 'returns the name' do
      expect(dave.name).to eq "Dave"
    end
  end

  describe '#hit_points' do
    it 'returns the hit points' do
      expect(dave.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end

  describe '#attack' do
    it 'reduces the hit_points by 10' do
      expect(jane).to receive(:receive_damage)
      Game.new.attack(jane)
    end
  end

  describe '#receive_damage' do
    it 'reduces the player hit_points' do
      expect { dave.receive_damage }.to change { dave.hit_points }.by -10
    end
  end
end
