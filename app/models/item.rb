class Item < ApplicationRecord

  with_options presence: true do
      validates :name
      validates :price
      validates :description
      validates :category_id
      validates :condition_id
      validates :shipping_charge_id
      validates :shipping_source_id
      validates :shipping_date_id
      validates :image
  end

  belongs_to :user
  has_one_attached :image
end
