class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :winner
      t.boolean :complete
      t.integer :players
      t.datetime    :time_start
      t.datetime    :time_end
      t.timestamps
    end
  end
end
