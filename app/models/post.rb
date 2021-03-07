class Post < ActiveRecord::Base
    belongs_to :jedi

    has_many :comments, dependent: :destroy
    has_many :commendations, dependent: :destroy
end
