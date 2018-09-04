class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :price,  :price_currency

  attribute :image do |object|
    {
      url: object.preview.url
    }
  end

  has_many :images, serializer: ImageSerializer
end
