module V1
  class GalleryAPI < Grape::API
    namespace :gallery do
      desc 'Gallery data'
      get '/' do
        images = Image.favorites
        render ImageSerializer.new(images).serialized_json
      end
    end
  end
end
