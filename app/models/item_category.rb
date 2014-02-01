class ItemCategory < ActiveRecord::Base
  has_many :items
  has_many :posts, -> { uniq }, through: :items
  belongs_to :item_category_type
end

