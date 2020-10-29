require 'game'

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  subject(:game_finished) { described_class.new(dead_player,player_2) }
  let(:player_1) { double :player, hit_points: 60 }
  let(:player_2) { double :player, hit_points: 60 }
  let(:dead_player) { double :player, hit_points: 0 }

  describe '#attack' do
    it 'damages the target player' do
      expect(player_2).to receive(:damage)
      Attack.run(player_2)
    end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'switches the turn after first attack' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end

  describe '#opponent_of' do
    it 'player 1' do
      expect(game.opponent_of(player_1)).to eq player_2
    end

    it 'player 2' do
      expect(game.opponent_of(player_2)).to eq player_1
    end
  end

  describe '#game_over?' do
    context 'all players are active' do
      it 'returns false if no-one is below 1HP' do

        expect(game.game_over?).to be false
      end
    end

    context 'one player is dead' do
      it 'returns true if player is dead' do
        expect(game_finished.game_over?).to be true
      end

      it 'loser returns the dead player' do
        expect(game_finished.loser).to eq dead_player
      end
    end
  end
end
