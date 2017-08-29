class GuessesController < ApplicationController

# get '/cards/:card_id/guesses/:id' do
#   @card = Card.find(params[:card_id])
#   @guess = @card.guesses.find(params[:id])
#   erb :'cards/show'
# end

#updates the guess
  def update
    @card = Card.find(params[:card_id])
    @deck = @card.deck
    @guess = Guess.find(params[:id])
    @round = Round.find(@guess.round_id)
    #add +1 to attempt, this might not work
    @guess.attempts += 1

    p @guess.card.answer
    p params[:guess][:answer].chomp

    if @guess.card.answer == params[:guess][:answer].chomp
      @guess.solved = true
    end

    @guess.save

    if @guess.solved == false
      @attempted = true
      p @attempted
      p "Yeah, this ain't solved"
      render :"cards/show"
    else
      p "redirecting"
      redirect_to deck_round_path(@card.deck.id, @round.id)
    end
  end


end
