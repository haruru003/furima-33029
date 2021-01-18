class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :post_code
      t.integer :prefecture_code_id
      t.string :city
      t.string :house_number
      t.string :building_name
      t.string :phone_number
      t.references :trading_record, foreign_key: true
      t.timestamps
    end
  end
end
