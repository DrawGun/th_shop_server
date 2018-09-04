class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

  attribute :main_url do |object|
    object.image.url(:main)
  end

  attribute :thumb_url do |object|
    object.image.url(:thumb)
  end
end
