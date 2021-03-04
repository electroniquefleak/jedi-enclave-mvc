require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

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
    if logged_in?
      @jedi = Jedi.find(session[:jedi_id])
      @posts = Post.all
      erb :index
    else 
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  def logged_in?
    !!current_user
  end

  def current_user
    Jedi.find(session[:jedi_id])
  end
 end
