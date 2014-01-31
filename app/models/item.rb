class Item < ActiveRecord::Base
  belongs_to :post
  belongs_to :item_category

  validates :name, presence: true
  validates :x, :y, :number, presence: true, numericality: true
end
