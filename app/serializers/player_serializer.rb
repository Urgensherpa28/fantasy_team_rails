class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :position, :goals, :team_id
end
