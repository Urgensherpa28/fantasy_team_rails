class User < ApplicationRecord
    has_many :fantasy_teams 

    validates :username, uniqueness: true
    has_secure_password
end
