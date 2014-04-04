class Item < ActiveRecord::Base
  before_save :set_item_category_name
  before_save :add_http

  belongs_to :post
  belongs_to :item_category

  validates :name, :item_category_id, presence: true
  validates :x, :y, :number, presence: true, numericality: true

  private

  def set_item_category_name
    self.item_category_name = item_category.name
  end

  def add_http
    unless url.blank? || url =~ /^http:\/\// || url =~ /^https:\/\//
      self.url = "http://#{url}"
    end
  end
end
