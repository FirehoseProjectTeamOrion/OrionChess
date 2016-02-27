require 'rails_helper'

RSpec.describe 'games/show.html.erb', type: :view do
  it 'has 8 white pawns(p) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*p\s*/, count: 8
        end
      end
    end
  end

  it 'has 8 black pawns(o) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*o\s*/, count: 8
        end
      end
    end
  end

  it 'has 2 white knights(n) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*n\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 black knights(m) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*m\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 white bishops(b) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*b\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 black bishops(v) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*v\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 white rooks(r) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*r\s*/, count: 2
        end
      end
    end
  end

  it 'has 2 black rooks(t) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*t\s*/, count: 2
        end
      end
    end
  end

  it 'has 1 white queen(q) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*q\s*/, count: 1
        end
      end
    end
  end

  it 'has 1 black queen(w) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*w\s*/, count: 1
        end
      end
    end
  end

  it 'has 1 white king(k) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*k\s*/, count: 1
        end
      end
    end
  end

  it 'has 1 black king(l) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('table#chessboard') do
      with_tag 'tr' do
        with_tag 'td' do
          with_tag 'span', text: /\s*l\s*/, count: 1
        end
      end
    end
  end
end
