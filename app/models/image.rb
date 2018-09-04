class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :product

  scope :favorites, -> { where(favorite: true) }
end
