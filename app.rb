require 'sinatra/base'

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

class Battle < Sinatra::Application
  use LoginScreen

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
