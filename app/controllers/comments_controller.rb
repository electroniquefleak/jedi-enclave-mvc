class CommentsController < ApplicationController
    post '/comments/:id' do

        data = {
            body: params[:body],
            jedi_id: current_jedi.id,
            post_id: params[:id]
        }

        Comment.create(data)

        redirect "/posts/#{ params[:id] }"
    end

    delete '/comments/:id' do
        comment = Comment.find_by_id(params[:id])

        comment.delete
    end
    
end