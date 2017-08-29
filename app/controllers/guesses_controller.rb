class GuessesController < ApplicationController

  def show
    @card = Card.find(params[:card_id])
    @guess = Guess.find(params[:id])
    render
  end

#updates the guess
  def update
    @card = Card.find(params[:card_id])
    @deck = @card.deck
    @guess = Guess.find(params[:id])
    @round = Round.find(@guess.round_id)
    #add +1 to attempt, this might not work
    @guess.attempts += 1
    if @guess.card.answer == params[:guess][:answer].chomp
      @guess.solved = true
    end
    @guess.save

    if @guess.solved == false
      redirect_to card_guess_path(@card.id, @guess.id)
    else
      p "redirecting"
      redirect_to deck_round_path(@card.deck.id, @round.id)
    end
  end


end
