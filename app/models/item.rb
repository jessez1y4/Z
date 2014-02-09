class Item < ActiveRecord::Base
  before_save :set_item_category_name

  belongs_to :post
  belongs_to :item_category

  validates :name, :item_category_id, presence: true
  validates :x, :y, :number, presence: true, numericality: true

  private

  def set_item_category_name
    self.item_category_name = item_category.name
  end
end
