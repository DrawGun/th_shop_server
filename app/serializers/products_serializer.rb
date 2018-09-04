class ProductsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :description, :price,  :price_currency

  attribute :image do |object|
    {
      url: object.preview.url
    }
  end
end
