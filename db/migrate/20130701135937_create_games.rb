class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner
      t.boolean :complete
      t.integer :players
      t.datetime    :duration
      t.timestamps
    end
  end
end
