module V1
  class ProductsAPI < Grape::API
    namespace :products do
      desc 'Products list'
      paginate per_page: 3
      get '/' do
        sleep 1
        products = paginate Product.all
        render ProductsSerializer.new(products).serialized_json
      end

      desc 'Product data'
      get '/:id' do
        sleep 1
        product = Product.find(params[:id])
        render ProductSerializer.new(product).serialized_json
      end

      desc 'Products gallery'
      get '/:id/gallery' do
        sleep 1
        product = Product.find(params[:id])
        render ImageSerializer.new(product.images).serialized_json
      end
    end
  end
end
