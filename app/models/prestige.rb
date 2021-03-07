class Prestige < ActiveRecord::Base
    has_many :jedis
    has_many :posts, through: :jedi

end
