require 'open-uri'
require 'net/http'
require 'json'

League.destroy_all 
Team.destroy_all
Player.destroy_all

leagues = [
    {name: 'La Liga', country: 'Spain', api_id: 775, logo: 'https://upload.wikimedia.org/wikipedia/en/3/35/La_Liga.png'}, 
    {name: 'EPL', country: 'England', api_id: 524, logo: 'https://hotcutdxf.com/wp-content/uploads/2019/07/epl-logo.jpg'}, 
    {name: 'Serie A', country: 'Italy', api_id: 891, logo: 'https://www.infosasa.com/wp-content/uploads/2015/06/serie-A.jpg'},
    {name: 'Bundesliga', country: 'Germany', api_id: 754, logo: 'https://pbs.twimg.com/media/DuSyTopX4AA1WzN.jpg'},
    {name: 'Ligue 1', country: 'France', api_id: 525, logo: 'https://i0.wp.com/www.meatmansoccer.com/wp-content/uploads/2016/06/L1-CONFORMA.jpg?resize=225%2C225'}
]

leagues.each do |league| 
   newLeague = League.create(name: league[:name], country: league[:country], logo: league[:logo])
   response = RestClient.get("https://api-football-v1.p.rapidapi.com/v2/teams/league/#{league[:api_id]}", {"x-rapidapi-key" => ENV['key1']})
    league_hash = JSON.parse(response.body)
    league_hash["api"]["teams"].each do |team|
        new_team = Team.create(name: team["name"], league_id: newLeague.id, stadium: team["venue_name"], city: team["venue_city"], logo: team["logo"])
        response = RestClient.get("https://api-football-v1.p.rapidapi.com/v2/players/team/#{team["team_id"]}", {"x-rapidapi-key" => ENV['key1']})
        players_hash = JSON.parse(response.body)
        players_hash["api"]["players"].each do |player|
            new_player = Player.create(name: player["player_name"], age: player["age"], position: player["position"], team_id: new_team.id, goals: player["goals"]["total"], nationality: player["nationality"], height: player["height"])
        end
    end
end

# new_player = Player.create(name: player["player_name"], age: player["age"], team_id: new_team.id, goals: rand(100))