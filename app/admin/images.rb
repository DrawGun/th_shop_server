ActiveAdmin.register Image do

  index do
    extend AdminTablesExtras

    image_column :image, width: 100

    actions
  end

  show do
    extend AdminTablesExtras

    attributes_table do
      row :product
      image_row :image, width: 100
    end
  end

  form do |f|
    extend AdminTablesExtras

    f.inputs do
      f.input :product_id, as: :select, collection: -> { Product.pluck(:title, :id) }
    end

    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? \
        ? image_tag(f.object.image.url, width: 100)
        : content_tag(:span, "no image yet")
      f.input :image_cache, as: :hidden
      f.input :remove_image, as: :boolean
    end

    f.actions
  end

  filter :product_id, as: :select, collection: -> { Product.pluck(:title, :id) }

  permit_params :image, :image_cache, :remove_image, :product_id
end
