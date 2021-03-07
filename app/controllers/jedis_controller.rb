class JedisController < ApplicationController
    get '/jedi/profile' do
        redirect_if_logged_out
        @jedi = Jedi.find(current_user.id)
        erb :'/jedis/profile'
    end

    get '/jedi/:id' do
        @jedi = Jedi.find(params[:id])
        erb :'/jedis/show'
    end

    patch '/jedi/edit/:id' do 
        jedi = Jedi.find(params[:id])
        if logged_in? && jedi.id == current_user.id
            if params[:prestige_id] == "1"
                local_img = "Guardian_Protector.png"
            elsif params[:prestige_id] == "2"
                local_img = "Jedi_Sentinel_Shadow.png"
            else
                local_img = "Consular_Sage.png"
            end
            image = "/images/#{local_img}"
            current_user.update_attribute(:prestige_id, params[:prestige_id])
            current_user.update_attribute(:image_url, image)
            flash[:message] = "Success! Updated is your Jedi!"
            redirect '/posts/index'
        else 
            flash[:message] = "The wrong Jedi, you are!"
            redirect '/prestiges/select'
        end
    end
end