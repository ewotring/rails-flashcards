# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

user1 = User.new(username: "Steve", email: 'steve@email.com', password: 'password')
user1.save
user2 = User.new(username: "Dave", email: 'dave@email.com', password: 'password')
user2.save
user3 = User.new(username: 'Kyle', email: 'kyle@email.com', password: 'password')
user3.save

Deck.find_or_create_by(name: 'Questions Three')
Deck.find_or_create_by(name: 'RPSs WARRIOR')
Deck.find_or_create_by(name: "Owl Bears")

Card.find_or_create_by(deck_id: 1,
  question: 'What is your name?',
  answer: 'Sir Lancelot')
Card.find_or_create_by(deck_id: 1,
  question: 'What is your quest?',
  answer: "To seek the holy grail" )
Card.find_or_create_by(deck_id: 1,
  question: 'WHAT, is your favorite color?',
  answer: 'blue')

Card.find_or_create_by(deck_id: 2, question: 'ROCK', answer: 'PAPER')
Card.find_or_create_by(deck_id: 2, question: 'PAPER', answer: 'SCISSORS' )
Card.find_or_create_by(deck_id: 2, question: 'SCISSORS', answer: 'ROCK')

Card.find_or_create_by(deck_id: 3, question: "What has the body of a bear, with the head of an owl?", answer: "owlbear")
Card.find_or_create_by(deck_id: 3, question: "I named my pet Sir Fluffy-Claws. What animal is it?", answer: "owlbear")
Card.find_or_create_by(deck_id: 3, question: "ARGH YAI READY KIDS!!? \n\n*generic kid sounds* \n\nI CAN'T HEEAARRRR YUUUU \n\n****KIDS LIKE TO YELL**** \n\nOOOOOHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH\n WHO LIVES IN A CAVE IN THE BACK OF THE WOODS?", answer: 'OWLBEAR OWLBEAR')

# Round.find_or_create_by(deck_id: 1, user_id: 1)
# Guess.find_or_create_by(round_id: 1, card_id: 1, solved: true, attempts: 1)
# Guess.find_or_create_by(round_id: 1, card_id: 2, solved: true, attempts: 1)
# Guess.find_or_create_by(round_id: 1, card_id: 3, solved: true, attempts: 2)

