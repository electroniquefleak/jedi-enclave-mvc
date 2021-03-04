class Commendation < ActiveRecord::Base
    belongs_to :jedi
    belongs_to :post
end
