class FantasyPlayersController < ApplicationController
    before_action :authorized, only: [:create, :destroy]

    def index
        @players = FantasyPlayer.all 

        render json: @players
    end

    def create
        @player = FantasyPlayer.create(fantasy_player_params)

        render json: @player 
    end


    private 

    def fantasy_player_params
        params.permit(:player_id, :fantasy_team_id)
    end
end
