class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :preview
      t.integer :price_cents, default: 0, null: false
      t.string :price_currency, default: "RUB", null: false

      t.timestamps
    end
  end
end
