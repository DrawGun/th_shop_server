module V1
  class ProductsAPI < Grape::API
    namespace :products do
      desc 'Products list'
      get '/' do
        products = Product.all
        render ProductsSerializer.new(products).serialized_json
      end

      desc 'Product data'
      get '/:id' do
        product = Product.find(params[:id])
        render ProductSerializer.new(product).serialized_json
      end

      desc 'Products gallery'
      get '/:id/gallery' do
        product = Product.find(params[:id])
        render ImageSerializer.new(product.images).serialized_json
      end
    end
  end
end
