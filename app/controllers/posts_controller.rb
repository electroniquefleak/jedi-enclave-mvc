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
                flash[:message] = "Invalid.  The post title or body was empty."
                erb :'posts/new_post'
            else
                #create the post
                Post.create(title: params[:title], body: params[:body], jedi_id: session[:jedi_id])
                flash[:message] = "You've come to the dark side. Post made."
                redirect '/index'
            end
        else 
            redirect '/login'
        end
    end

    get '/posts/edit/:id' do
        #verify/authenticate the current user & the post owner
        @post = Post.find(params[:id])
        if logged_in? && @post.jedi_id == current_user.id
            @post
            erb :'posts/edit_post'
        else
            # possible error or flash message
            flash[:message] = "This isn't the post you are looking to edit."
            redirect '/index'
        end 

    end

    patch "/posts/edit/:id" do
        @post = Post.find(params[:id])
        if logged_in? && @post.jedi_id == current_user.id
            if params[:title].empty? || params[:body].empty?
                flash[:message] = "Empty are your inputs!"
                #flash[:alert_type] = danger
                erb :'posts/edit_post'
            else
                Post.update(title: params[:title], body: params[:body])
                flash[:message] = "Success! Updated is your post!"
                #flash
                redirect '/index'
            end
        else 
            flash[:message] = "Incomplete are your credentials!"
            redirect '/index'
        end
    end
    #SHOW page
    get '/posts/:id' do
        @post = Post.find(params[:id])
        erb :'posts/show_post'
    end

    #Destroy page
    delete 'posts/:id' do
        post = Post.find(params[:id])
        if logged_in? && post.jedi_id == current_user.id
            #delete the post
            post.destroy
            flash[:message] = "The post is now a member of the force."
            redirect '/index'
        else
            flash[:message] = "Denied access you are!"
            redirect '/index'
        end
    end


    
    #how to get the user's collection of posts
    #@my_posts = Post.where(jedi_id: current_user.id)
end