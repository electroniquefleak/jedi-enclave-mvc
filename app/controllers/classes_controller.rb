class ClassesController < ApplicationController

    get '/classes' do
        @classes = Class.all.includes(:jedi, :founder, :leader)
    end
end