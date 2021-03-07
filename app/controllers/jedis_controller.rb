class JedisController < ApplicationController
    get '/jedi/profile' do
        redirect_if_logged_out
        @jedi = Jedi.find(current_user.id)
        erb :'/jedis/profile'
    end

    get '/jedi/show' do 
    end

    patch '/jedi/edit/:id' do 
        jedi = Jedi.find(params[:id])
        if logged_in? && jedi.id == current_user.id
            current_user.update_attribute(:prestige_id, params[:prestige_id])
            flash[:message] = "Success! Updated is your jedi!"
            redirect '/posts/index'
        else 
            flash[:message] = "wrong jedi you are!"
            redirect '/prestiges/select'
        end
    end
end