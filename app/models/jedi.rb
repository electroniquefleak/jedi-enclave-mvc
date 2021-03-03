class Jedi < ActiveRecord::Base
    validates :username, :password, presence: true
    validates :username, uniqueness: true

    belongs_to :prestige

    has_many :posts

    has_secure_password
end