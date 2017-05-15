class Contact < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 30 }
  validates :phone_number, presence: true,
                           format: { with: VALID_PHONE_NUMBER_REGEX, message: "should contain only numbers" },
                           length: { maximum: 15 }
end
