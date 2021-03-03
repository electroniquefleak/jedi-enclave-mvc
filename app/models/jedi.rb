class Jedi < ActiveRecord::Base
    belongs_to :prestige

    has_many :posts

    has_secure_password
end