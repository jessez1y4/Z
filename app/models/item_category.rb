class ItemCategory < ActiveRecord::Base
  has_many :items
  belongs_to :item_category_type
end

