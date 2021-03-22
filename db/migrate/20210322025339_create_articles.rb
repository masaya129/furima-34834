class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer :category_id,       null: false
      t.integer :item_status_id,    null: false
      t.integer :delivery_price_id, null: false
      t.integer :delivery_area_id,  null: false
      t.integer :delivery_date_id,  null: false
      t.timestamps
    end
  end
end
