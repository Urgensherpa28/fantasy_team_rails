class FantasyTeamSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name

  has_many :fantasy_players
end
