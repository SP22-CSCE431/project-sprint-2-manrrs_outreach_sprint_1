class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.primary_key = 'Messages_ID'
end
