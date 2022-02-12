class MessageHistory < ApplicationRecord
  has_many :message
  has_many :student
  has_many :admin
end
