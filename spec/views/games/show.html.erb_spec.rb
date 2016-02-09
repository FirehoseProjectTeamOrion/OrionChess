require 'rails_helper'

RSpec.describe 'games/show.html.erb', type: :view do
  it 'has 8 white pawns(p) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('p')
  end

  it 'has 8 black pawns(o) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('o')
  end

  it 'has 2 white knights(n) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('n')
  end

  it 'has 2 black knights(m) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('m')
  end

  it 'has 2 white bishops(b) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('b')
  end

  it 'has 2 black bishops(v) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('p')
  end

  it 'has 2 white rooks(r) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('r')
  end

  it 'has 2 black rooks(t) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('t')
  end

  it 'has 1 white queen(q) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('q')
  end

  it 'has 1 black queen(w) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('w')
  end

  it 'has 1 white king(k) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('k')
  end

  it 'has 1 black king(l) on the board' do
    assign(:game, FactoryGirl.create(:game))
    render

    expect(rendered).to include('l')
  end
end
