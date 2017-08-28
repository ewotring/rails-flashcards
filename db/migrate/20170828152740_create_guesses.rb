class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.integer :round_id
      t.integer :card_id
      t.boolean :solved, :default => false
      t.integer :attempts, :default => 0

      t.timestamps

    end
  end
end
