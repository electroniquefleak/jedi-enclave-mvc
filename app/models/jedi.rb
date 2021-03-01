class Jedi < ActiveRecord::Base
    belongs_to :class

    has_many :posts

    has_secure_password
end