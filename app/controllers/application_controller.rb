require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'bingbangbong'
    set :views, 'app/views'
  end

  get "/" do
    redirect '/login'
  end

  get '/login' do
    redirect_if_logged_in
    erb :index
  end

  get '/registration' do
    erb :registration
  end

  post '/registration' do
    jedi = Jedi.new(params)
    if jedi.save
      #session
      redirect '/index'
    else
      @error = "These aren't the credentials you're looking for!"
      redirect '/registration'
    end
  end


 end
