require 'bcrypt'
class User < ApplicationRecord

  has_secure_password
  validates :email, uniqueness: true

  validates_presence_of :username, :email


  has_many :rounds
  has_many :guesses
  has_many :played_decks, through: :rounds, source: :deck
end
