class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :encrypted_password, presence: true
  # validates :reset_password_token, presence: true
  # validates :reset_password_sent_at, presence: true
  # validates :remember_created_at, presence: true
  has_many :message
end
