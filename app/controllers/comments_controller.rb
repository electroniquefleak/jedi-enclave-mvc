class CommentsController < ApplicationController
    post '/comments/:id' do
        data = {
            body: params[:body],
            jedi_id: current_user.id,
            post_id: params[:id]
        }

        Comment.create(data)
        flash[:message] = "Success! You commented on the post!"
        redirect "/posts/#{ params[:id] }"
    end

    delete '/comments/:id' do
        comment = Comment.find_by_id(params[:id])

        comment.delete
    end
end