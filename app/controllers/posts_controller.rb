class PostsController < ApplicationController
    get '/posts/new' do
        if logged_in?
            erb :'posts/new_post'
        else 
            redirect '/login'
        end
    end

    post '/posts/add' do
        if logged_in?
            if params[:title].empty? || params[:body].empty?
                @error = "Invalid.  The post title or body was empty."
            else
                #create the post
                Post.create(title: params[:title], body: params[:body], jedi_id: session[:jedi_id])
                redirect '/index'
            end
        else 
            redirect '/login'
        end
    end
end