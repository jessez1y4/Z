class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def self.suggestions_for(prefix)
    where('name LIKE ?', "#{prefix.upcase}%")
      .order('posts_count DESC')
      .limit(5)
      .pluck(:name)
  end
end
