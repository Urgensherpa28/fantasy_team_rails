class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :position
      t.string :nationality 
      t.integer :height
      t.integer :goals
      t.belongs_to :team 

      t.timestamps
    end
  end
end
