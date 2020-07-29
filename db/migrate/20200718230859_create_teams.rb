class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :logo
      t.string :name
      t.belongs_to :league
      t.string :stadium
      t.string :city

      t.timestamps
    end
  end
end
