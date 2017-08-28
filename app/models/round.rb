class Round < ApplicationRecord
  has_many :guesses
  belongs_to :deck
  belongs_to :player, class_name: User
  has_many :cards, through: :deck

  def accuracy
    total_attempts = 0
    self.guesses.each {|guess| total_attempts += guess.attempts}
    (100 * (self.guesses.length.to_f / total_attempts.to_f)).to_i
  end

  def solve_first_try_count
    (self.guesses.select{|guess| guess.attempts == 1}).size
  end

  def total_attempts
    self.guesses.map{|guess| guess.attempts}.reduce(:+)
  end


  def next_unsolved_card

  #These are the remaining guesses that need to be solved
    unsolved_guesses = self.guesses.select{ |guess| guess.solved == false}
    # unsolved_guesses = self.guesses.partition{ |guess| guess.solved == false}[0]

    #This is the lowest attempts count for unsolved guesses
    least_attempts_num = unsolved_guesses.map{|guess| guess.attempts}.sort.first

    #This shows the next guess to solve, if there is one
    next_to_solve = unsolved_guesses.select{|guess| guess.attempts == least_attempts_num}.first

    if unsolved_guesses.size == 0
      return nil
    else
      next_to_solve.card
    end

  end
end
