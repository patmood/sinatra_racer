class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner
      t.integer :time
      t.boolean :complete
      t.integer :players
      t.timestamps
    end
  end
end
