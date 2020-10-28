require 'sinatra/base'

class LoginScreen < Sinatra::Base
  enable :sessions

  get('/login') { erb :login }

  post('/login') do
    if params['name'] == 'admin' && params['password'] == 'admin'
      session['user_name'] = params['name']
      redirect '/h'
    else
      redirect '/login'
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

  get '/h' do
    "Hello world! welcomes #{session['user_name']}."
  end

  run! if app_file == $0
end
