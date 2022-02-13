class MessageHistory < ApplicationRecord
  validates :student_id, presence: true
  validates :message_id, presence: true
  validates :date_sent, presence: true
  has_many :message
  has_many :student, class_name: 'Student', foreign_key: 'Student_ID'
  has_many :admin
end
