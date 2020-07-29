class PlayersController < ApplicationController

    def index
        @players = Player.all.limit(5000)

        render json: @players
    end
end
