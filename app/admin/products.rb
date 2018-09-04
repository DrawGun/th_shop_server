ActiveAdmin.register Product do

  index do
    extend AdminTablesExtras

    column :title
    money_column :price
    image_column :preview, width: 100

    actions
  end

  show do
    extend AdminTablesExtras

    attributes_table do
      row :title
      money_row :price
      image_row :preview, width: 100
    end
  end

  form do |f|
    extend AdminTablesExtras

    f.inputs do
      f.input :title
      f.input :price
      f.input :price_currency,
        as: :select,
        collection: currencies_list,
        include_blank: false
    end

    f.inputs do
      f.input :preview, as: :file, hint: f.object.preview.present? \
        ? image_tag(f.object.preview.url, width: 100)
        : content_tag(:span, "no preview yet")
      f.input :preview_cache, as: :hidden
      f.input :remove_preview, as: :boolean
    end

    f.actions
  end

  filter :title

  permit_params :title, :preview, :preview_cache, :remove_preview, :price_cents, :price_currency
end
