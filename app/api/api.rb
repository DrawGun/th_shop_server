class API < Grape::API
  format :json
  formatter :json, Grape::Formatter::FastJsonapi

  before do
    header 'Access-Control-Allow-Origin', '*'
  end

  namespace :v1 do
    mount V1::ProductsAPI
    mount V1::GalleryAPI
    mount V1::ImagesAPI
  end
end
