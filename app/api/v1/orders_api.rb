module V1
  class OrdersAPI < Grape::API
    namespace :orders do
      desc 'Create order'
      post '/' do
        status 200
        { success: true }
      end
    end
  end
end
