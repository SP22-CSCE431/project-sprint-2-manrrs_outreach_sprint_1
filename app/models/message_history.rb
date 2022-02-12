class MessageHistory < ApplicationRecord
  has_many :message
  has_many :student, class_name: 'Student', foreign_key: 'Student_ID'
  has_many :admin
end
