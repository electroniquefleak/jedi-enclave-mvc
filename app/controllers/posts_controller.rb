class PostsController < ApplicationController
    
    get '/posts/index' do
        if logged_in?
          @jedi = Jedi.find(session[:jedi_id])
          @posts = Post.all
          erb :'posts/post_index'
        else 
          redirect '/login'
        end
    end
    
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
                flash[:message] = "Invalid.  The post title or body was empty."
                erb :'posts/new_post'
            else
                Post.create(title: params[:title], body: params[:body], jedi_id: session[:jedi_id])
                flash[:message] = "You've come to the dark side. Post made."
                redirect '/posts/index'
            end
        else 
            redirect '/login'
        end
    end

    get '/posts/edit/:id' do
        @post = Post.find(params[:id])
        if logged_in? && @post.jedi_id == current_user.id
            @post
            erb :'posts/edit_post'
        else
            flash[:message] = "This isn't the post you are looking to edit."
            redirect '/posts/index'
        end 

    end

    patch "/posts/edit/:id" do
        @post = Post.find(params[:id])
        if logged_in? && @post.jedi_id == current_user.id
            if params[:title].empty? || params[:body].empty?
                flash[:message] = "Empty are your inputs!"
                erb :'posts/edit_post'
            else
                @post.update(title: params[:title], body: params[:body])
                flash[:message] = "Success! Updated is your post!"
                redirect '/posts/index'
            end
        else 
            flash[:message] = "Incomplete are your credentials!"
            redirect '/posts/index'
        end
    end

    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :'posts/show_post'
    end

    delete '/posts/:id' do
        post = Post.find(params[:id])
        if logged_in? && post.jedi_id == current_user.id
            post.destroy
            flash[:message] = "The post is now a member of the force."
            redirect '/posts/index'
        else
            flash[:message] = "Denied access you are!"
            redirect '/posts/index'
        end
    end

    post '/posts/:id/commendation' do
        post = Post.find(params[:id])
        if post.commendations.any?{|commendation| commendation.jedi_id == current_user.id}
            flash[:message] = "Post already commended!"
            redirect "/posts/#{post.id}"
        else
            Commendation.create(jedi_id: current_user.id, post_id: post.id)
            flash[:message] = "You've liked the post: #{post.title}!"
            redirect "/posts/#{post.id}"
        end
    end
    
    delete '/posts/:id/commendation' do
        post = Post.find(params[:id])
        if post.commendations.any?{|commendation| commendation.jedi_id == current_user.id}
            commendation = Commendation.find_by(jedi_id: current_user.id, post_id: post.id)
            commendation.destroy
            flash[:message] = "You no longer like the post: #{post.title}!"
            redirect "/posts/#{post.id}"
        else
            flash[:message] = "This isn't your fight!"
            redirect "/posts/#{post.id}"
        end
    end

end