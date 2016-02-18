require 'rails_helper'

RSpec.describe 'pieces/show.html.erb', type: :view do
  let(:game) { FactoryGirl.create(:game) }
  it 'has 8 white pawns(p) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*p\s*/, count: 8
        end
      end
    end
  end

  it 'has 8 black pawns(o) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*o\s*/, count: 8
        end
      end
    end
  end

  it 'has 2 white knights(n) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*n\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 black knights(m) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*m\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 white bishops(b) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*b\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 black bishops(v) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*v\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 white rooks(r) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*r\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 black rooks(t) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*t\s*/, count: 2
        end
      end
    end
  end

  it 'has 1 white queen(q) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*q\s*/, count: 1
        end
      end
    end
  end

  it 'has 1 black queen(w) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*w\s*/, count: 1
        end
      end
    end
  end

  it 'has 1 white king(k) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*k\s*/, count: 1
        end
      end
    end
  end

  it 'has 1 black king(l) on the board' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a', text: /\s*l\s*/, count: 1
        end
      end
    end
  end

  it 'has one square with the id "selected"' do
    assign(:game, game)
    assign(:piece, game.pieces.first)
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'a#selected', count: 1
        end
      end
    end
  end
end
