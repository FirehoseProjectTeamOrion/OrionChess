require 'rails_helper'

RSpec.describe 'games/show.html.erb', type: :view do
  it 'has 8 white pawns(p) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'p', :count => 8
    end
  end

  it 'has 8 black pawns(o) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'o', :count => 8
    end
  end

  it 'has 2 white knights(n) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'n', :count => 2
    end
  end

  it 'has 2 black knights(m) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'm', :count => 2
    end
  end

  it 'has 2 white bishops(b) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'b', :count => 2
    end
  end

  it 'has 2 black bishops(v) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'v', :count => 2
    end
  end

  it 'has 2 white rooks(r) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'r', :count => 2
    end
  end

  it 'has 2 black rooks(t) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 't', :count => 2
    end
  end

  it 'has 1 white queen(q) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'q', :count => 1
    end
  end

  it 'has 1 black queen(w) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'w', :count => 1
    end
  end

  it 'has 1 white king(k) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'k', :count => 1
    end
  end

  it 'has 1 black king(l) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to have_tag('div', :with => { :class => 'chessboard' }) do
      with_tag 'div', :text => 'l', :count => 1
    end
  end
end
