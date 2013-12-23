class Item < ActiveRecord::Base
  belongs_to :post

  validates :name, presence: true
  validates :x, :y, :number, presence: true, numericality: true
end
