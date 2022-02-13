class Message < ApplicationRecord
    belongs_to :User
    has_many :student
end
