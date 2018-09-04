class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image
      t.string :alt
      t.references :product
      t.boolean :favorite, default: false, null: false

      t.timestamps
    end
  end
end
