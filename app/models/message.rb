class Message < ApplicationRecord
    validates :admin_id, presence: true
    validates :text, presence: true
    validates :date_created, presence: true
    has_many :student
end
