require 'sinatra/base'

class MakersRoute < Sinatra::Base
  enable :sessions

  get '/' do
    erb :m_names
  end

  post '/play' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    @player_1 = $player_1
    @player_2 = $player_2

    erb :m_play
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    Game.new.attack(@player_2)

    erb :m_attack
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
  use LoginScreen
  use MakersRoute

  before do
    unless session['user_name']
        halt "Access denied, please <a href='/login'>login</a>"
    end
  end

  get '/battle' do
    "BATTLE \u2122, welcomes #{session['user_name']} to the fray!!"
  end

  run! if app_file == $0
end
