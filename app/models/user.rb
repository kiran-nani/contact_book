class User < ApplicationRecord
	has_many :contacts
	before_save { email.downcase! }
	validates :name, presence: true, length: { minimum: 5, maximum: 55 }
	validates :email, presence: true, length: { maximum: 50 }, 
																		format: { with: VALID_EMAIL_REGEX },
																		uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6, maximum: 15 }
end
