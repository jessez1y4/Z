class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

  has_many :bookmarkings, dependent: :destroy

  has_many :default_taggings, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def self.suggestions_for(prefix)
    where('name LIKE ?', "#{prefix.upcase}%")
      .order('posts_count DESC')
      .limit(5)
      .pluck(:name)
  end

  def self.top(n = 1)
    order('posts_count DESC').limit(n)
  end
end
