class ProductSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title_ru, :title_en, :description_ru, :description_en, :price, :price_currency

  attribute :image do |object|
    {
      url: object.preview.url
    }
  end
end
