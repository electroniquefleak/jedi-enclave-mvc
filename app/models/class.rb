class Class < ActiveRecord::Base
    has_many :jedi
    has_many :posts, through: :jedi
end
