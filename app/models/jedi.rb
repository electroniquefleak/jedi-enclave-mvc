class Jedi < ActiveRecord::Base
    belongs_to :class

    has_many :posts
end