class FantasyTeam < ApplicationRecord
    has_many :fantasy_players
    has_many :players, through: :fantasy_players
    belongs_to :user

    validates :name, presence: true

end