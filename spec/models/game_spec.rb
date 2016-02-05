require "rails_helper"



RSpec.describe Game, :type => :model do
    describe "#populate_board!" do
        it "should create a black Knight and a white pawn" do
            game = Game.create
            expect(game.pieces(:color => "black").find_by(row: 0, column: 1)).to be_a Knight
            expect(game.pieces(:color => "white").find_by(row: 6, column: 1)).to be_a Pawn
            
            
            
            
        end
        
        it "should create 32 pieces" do
            
            game = Game.create
            expect(game.pieces.count).to eq 32
            
        end


    end
end