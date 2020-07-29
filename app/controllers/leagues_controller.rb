class LeaguesController < ApplicationController

    def index
        @leagues = League.all 

        render json: @leagues 
    end
end
