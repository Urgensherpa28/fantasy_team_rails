class FantasyPlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :fantasy_team_id, :player_id

  def name 
    object.player.name
  end

end
