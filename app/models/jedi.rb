class Jedi < ActiveRecord::Base
    validates :username, :password, presence: true
    validates :username, uniqueness: true

    belongs_to :prestige

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :commendations, dependent: :destroy

    has_secure_password
end