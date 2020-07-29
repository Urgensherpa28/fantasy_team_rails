class Player < ApplicationRecord
    has_many :fantasy_players
    has_many :fantasy_teams, through: :fantasy_players
    belongs_to :team 

    validates :name, uniqueness: true
    # validates_uniqueness_of :name
end
