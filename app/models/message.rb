class Message < ApplicationRecord
  validates :full_name, presence: true, length: {minimum: 3}
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }  
  validates :phone, presence: true
  validates :body, length: { minimum: 1, maximum: 280 }
end
