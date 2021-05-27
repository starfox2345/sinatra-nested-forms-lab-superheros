require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do

        erb :super_hero
    end

    post '/teams' do
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        members = params[:team][:members]

        members.each do |member_parameter|
            SuperHero.new({name: member_parameter[:name], power: member_parameter[:power], bio: member_parameter[:bio]})
        end
        @super_heroes = SuperHero.all
        
        erb :team
    end

end
