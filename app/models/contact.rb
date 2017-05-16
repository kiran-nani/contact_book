class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, presence: true, length: { maximum: 30 }
  validates :phone_number, presence: true,                           
                           length: { maximum: 15 }
  mount_uploader :contact_photo, ContactPhotoUploader                          
end
