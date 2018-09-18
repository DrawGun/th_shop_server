class API < Grape::API
  include Rails::Pagination

  format :json
  formatter :json, Grape::Formatter::FastJsonapi

  before do
    header 'Access-Control-Allow-Origin', '*'
    header 'Access-Control-Expose-Headers', 'X-Total, X-Per-Page, X-Page'
  end

  namespace :v1 do
    mount V1::ProductsAPI
    mount V1::GalleryAPI
    mount V1::ImagesAPI
  end
end
