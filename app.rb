require 'sinatra/base'
require './lib/game'
require './lib/player'
require './lib/attack'

class MakersRoute < Sinatra::Base
  before do
    @game = Game.instance
  end

  get '/' do
    erb :m_names
  end

  post '/play' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb :m_play
  end

  get '/attack' do
    Attack.run(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect '/game_over'
    else
      erb :m_attack
    end
  end

  post '/attack' do
    @game.switch_turns
    redirect '/play'
  end

  get '/game_over' do
    erb :m_game_over
  end
end

class LoginScreen < Sinatra::Base
  enable :sessions

  get('/login') { erb :login }

  post('/login') do
    if params['name'] == '' || params['battle_name'] == ''
      redirect '/login'
    else
      session['user_name'] = params['battle_name']
      redirect '/battle'
    end
  end
end

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'here be ninjas'

  use LoginScreen
  use MakersRoute

#  before do
#    halt "Access denied, please <a href='/login'>login</a>" unless session['user_name']
#  end

  get '/battle' do
    "BATTLE \u2122, welcomes #{session['user_name']} to the fray!!"
  end

  run! if app_file == $PROGRAM_NAME
end
