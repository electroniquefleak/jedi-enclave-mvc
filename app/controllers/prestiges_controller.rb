class PrestigesController < ApplicationController
    get '/prestiges/select' do
        redirect_if_logged_out
        @prestiges = Prestige.all
        @jedi = current_user
        erb :'prestiges/select'
    end

    get '/prestiges/index' do
        @prestiges = Prestige.all
    end
end