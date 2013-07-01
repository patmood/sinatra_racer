class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |player|
      player.string :name
      player.integer :wins
      player.integer :losses
      player.timestamps
    end
  end
end
