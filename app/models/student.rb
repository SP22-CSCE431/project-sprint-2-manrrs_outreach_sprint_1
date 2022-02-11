class Student < ApplicationRecord
    validates :Phone_Number, :presence => true
    # :uniqueness => true
  end
  