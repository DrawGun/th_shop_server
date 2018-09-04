class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  version :main do
    process resize_to_fit: [400, 400]
  end

  version :thumb, from_version: :main do
    process resize_to_fit: [100, 100]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
