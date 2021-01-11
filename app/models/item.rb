class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :preparation_day
  belongs_to :prefecture_code
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :introduction
    validates :price
    validates :image
  end
  
  validates :price, :numericality => { greater_than_or_equal_to:300, less_than_or_equal_to:9999999, only_integer: true }
  validates :category_id, :item_condition_id, :postage_payer_id, :preparation_day_id, :prefecture_code_id, numericality: { other_than: 1 }
  
end