class Product < ApplicationRecord
  extend ActiveRecordExtension

  has_money_columns(:price)

  mount_uploader :preview, ImageUploader

  has_many :images
end
