class RoundsController < ApplicationController

  def show
    @round = Round.find(params[:id])
    @user = current_user
    @card = @round.next_unsolved_card
    p '8' * 88
    p @card

    if !@card
      render :show
    else
      @guess = Guess.find_by(card_id: @card.id, round_id: @round.id)
      render :'cards/show'
    end
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @round = Round.create(deck_id: @deck.id, player_id: 1)
    @cards = @deck.cards
    @cards.each do |card|
      Guess.create(round_id: @round.id, card_id: card.id)
    end
    redirect_to deck_round_path(@deck.id, @round.id)
  end
end
