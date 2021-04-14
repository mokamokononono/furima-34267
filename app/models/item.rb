class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :shipping_source
  belongs_to :shipping_date

  with_options presence: true do
      validates :name
      validates :price
      validates :description
      validates :image
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :shipping_charge_id
        validates :shipping_source_id
        validates :shipping_date_id
      end
  end

  belongs_to :user
  has_one_attached :image
end