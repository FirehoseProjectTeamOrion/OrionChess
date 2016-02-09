require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GamesHelper. For example:
#
# describe GamesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GamesHelper, type: :helper do
  describe '#draw_piece' do
    it 'returns nil when there is no piece at the given location' do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 4, 4)).to eq(nil)
    end

    it "returns 'p' when there is a white pawn at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 6, 1)).to eq('p')
    end

    it "returns 'o' when there is a black pawn at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 1, 6)).to eq('o')
    end

    it "returns 'n' when there is a white knight at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 7, 1)).to eq('n')
    end

    it "returns 'm' when there is a black knight at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 0, 6)).to eq('m')
    end

    it "returns 'b' when there is a white bishop at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 7, 2)).to eq('b')
    end

    it "returns 'v' when there is a black bishop at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 0, 5)).to eq('v')
    end

    it "returns 'r' when there is a white rook at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 7, 0)).to eq('r')
    end

    it "returns 't' when there is a black rook at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 0, 7)).to eq('t')
    end

    it "returns 'q' when there is a white queen at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 7, 4)).to eq('q')
    end

    it "returns 'w' when there is a black queen at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 0, 4)).to eq('w')
    end

    it "returns 'k' when there is a white king at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 7, 3)).to eq('k')
    end

    it "returns 'l' when there is a black king at the given location" do
      game = FactoryGirl.create(:game)

      expect(helper.draw_piece(game, 0, 3)).to eq('l')
    end
  end
end
