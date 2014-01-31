# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ItemCategoryType.destroy_all
ItemCategory.destroy_all

ItemCategoryType.create name: 'clothing'
ItemCategoryType.create name: 'shoes'
ItemCategoryType.create name: 'accessories'


ItemCategory.create name: 'blazer', item_category_type_id: 1
ItemCategory.create name: 'cardigan', item_category_type_id: 1
ItemCategory.create name: 'dress', item_category_type_id: 1
ItemCategory.create name: 'intimate', item_category_type_id: 1
ItemCategory.create name: 'jeans', item_category_type_id: 1
ItemCategory.create name: 'one-piece', item_category_type_id: 1
ItemCategory.create name: 'outerwear', item_category_type_id: 1
ItemCategory.create name: 'pants', item_category_type_id: 1
ItemCategory.create name: 'shirt', item_category_type_id: 1
ItemCategory.create name: 'shorts', item_category_type_id: 1
ItemCategory.create name: 'skirt', item_category_type_id: 1
ItemCategory.create name: 'suit', item_category_type_id: 1
ItemCategory.create name: 'sweater', item_category_type_id: 1
ItemCategory.create name: 'swim', item_category_type_id: 1
ItemCategory.create name: 'top', item_category_type_id: 1
ItemCategory.create name: 'vest', item_category_type_id: 1
ItemCategory.create name: 'boots', item_category_type_id: 2
ItemCategory.create name: 'dress shoes', item_category_type_id: 2
ItemCategory.create name: 'flats', item_category_type_id: 2
ItemCategory.create name: 'heels & wedges', item_category_type_id: 2
ItemCategory.create name: 'sandals', item_category_type_id: 2
ItemCategory.create name: 'sneakers', item_category_type_id: 3
ItemCategory.create name: 'bag', item_category_type_id: 3
ItemCategory.create name: 'belt', item_category_type_id: 3
ItemCategory.create name: 'cufflink', item_category_type_id: 3
ItemCategory.create name: 'eyewear', item_category_type_id: 3
ItemCategory.create name: 'gloves', item_category_type_id: 3
ItemCategory.create name: 'hair', item_category_type_id: 3
ItemCategory.create name: 'hat', item_category_type_id: 3
ItemCategory.create name: 'jewelry', item_category_type_id: 3
ItemCategory.create name: 'legwear', item_category_type_id: 3
ItemCategory.create name: 'make-up', item_category_type_id: 3
ItemCategory.create name: 'scarf', item_category_type_id: 3
ItemCategory.create name: 'suspender', item_category_type_id: 3
ItemCategory.create name: 'tie', item_category_type_id: 3
ItemCategory.create name: 'umbrella', item_category_type_id: 3
ItemCategory.create name: 'wallet', item_category_type_id: 3
ItemCategory.create name: 'watch', item_category_type_id: 3
