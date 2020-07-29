class FantasyTeamsController < ApplicationController
    before_action :authorized, only: [:create, :destroy, :index]

    def index
        @fantasy_teams = @user.fantasy_teams 

        render json: @fantasy_teams
    end

    def show
        @fantasy_team = FantasyTeam.find(params[:id])

        render json: @fantasy_team
    end

    def create
        @fantasy_team = @user.fantasy_teams.create(fantasy_team_params)

        render json: @fantasy_team
    end

    def destroy
        @fantasy_team = FantasyTeam.find(params[:id])
        @fantasy_team.destroy

        render json: @fantasy_team
    end

    private 

    def fantasy_team_params
        params.permit(:name)
    end

end