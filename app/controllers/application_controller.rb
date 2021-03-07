require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, 'bingbangbong'
    set :views, 'app/views'
  end

  not_found do
    status 404
    erb :error
  end

  get "/" do
    redirect_if_logged_in
    erb :index
  end

  get '/login' do
    redirect_if_logged_in
    erb :login
  end

  post '/login' do
    jedi = Jedi.find_by(username: params[:username])
    if jedi && jedi.authenticate(params[:password])
      session[:jedi_id]= jedi.id
      redirect '/posts/index'
    elsif jedi
      @error = "This isn't the password you're looking for!"
      redirect '/login'
    else
      @error = "This isn't the username you're looking for!"
      redirect '/login'
    end
  end

  get '/registration' do
    redirect_if_logged_in
    erb :registration
  end

  post '/registration' do
    jedi = Jedi.new(params)
    if jedi.save
      session[:jedi_id]= jedi.id
      redirect '/prestiges/select'
    else
      @error = "These aren't the credentials you're looking for!"
      redirect '/registration'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  def logged_in?
    !!session[:jedi_id]
  end

  def current_user
    @current_user ||= Jedi.find(session[:jedi_id])
  end

  def redirect_if_logged_in
    if logged_in?
      redirect 'posts/index'
    end
  end
  
  def redirect_if_logged_out
    if !logged_in?
      redirect '/'
    end
  end

  def format_timestamp(created_at)
    create_at = created_at.localtime
    created_at.strftime("on %m/%d/%Y at %I:%M %p")
  end

 end
