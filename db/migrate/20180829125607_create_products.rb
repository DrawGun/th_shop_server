class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title_ru
      t.string :title_en
      t.text :description_ru
      t.text :description_en
      t.string :preview
      t.integer :price_cents, default: 0, null: false
      t.string :price_currency, default: "RUB", null: false

      t.timestamps
    end
  end
end
