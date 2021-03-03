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
    #redirect_if_logged_in
    erb :login
  end

  post '/login' do
    jedi = Jedi.find_by(username: params[:username])
    if jedi && jedi.authenticate(params[:password])
      session[:jedi_id]= jedi.id
      redirect '/index'
    elsif jedi
      @error = "This isn't the password you're looking for!"
      redirect '/login'
    else
      @error = "This isn't the username you're looking for!"
      redirect '/login'
    end
  end

  get '/registration' do
    erb :registration
  end

  post '/registration' do
    jedi = Jedi.new(params)
    if jedi.save
      session[:jedi_id]= jedi.id
      redirect '/index'
    else
      @error = "These aren't the credentials you're looking for!"
      redirect '/registration'
    end
  end

  get '/index' do
    erb :index
  end

 end
