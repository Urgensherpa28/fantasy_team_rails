class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :league_id, :stadium, :city, :logo

end
