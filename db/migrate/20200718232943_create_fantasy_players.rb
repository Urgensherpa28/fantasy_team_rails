class CreateFantasyPlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :fantasy_players do |t|
      t.belongs_to :fantasy_team 
      t.belongs_to :player 

      t.timestamps
    end
  end
end
