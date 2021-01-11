class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :introduction
      t.integer :category_id
      t.integer :item_condition_id
      t.integer :postage_payer_id
      t.integer :prefecture_code_id
      t.integer :preparation_day_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
