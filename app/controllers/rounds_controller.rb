class RoundsController < ApplicationController

  def show
    "I'm a little teapot"
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @round = Round.new(deck_id: @deck.id, player_id: 1)
    @round.save
    redirect_to deck_round_path(@deck.id, @round.id)
  end
end
