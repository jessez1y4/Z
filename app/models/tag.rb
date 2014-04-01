class Tag < ActiveRecord::Base
  before_save :upcase_tag

  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings

  has_many :bookmarkings, dependent: :destroy

  has_many :default_taggings, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  scope :scenario, -> { where(category: 1) }
  scope :style, -> { where(category: 2) }
  scope :element, -> { where(category: 3) }
  scope :college, -> { where(category: 4) }
  scope :city, -> { where(category: 5) }

  def self.suggestions_for(prefix)
    where('name ILIKE ?', "#{prefix}%")
      .order('posts_count DESC')
      .limit(5)
      .pluck(:name)
  end

  def self.top(n = nil)
    order('posts_count DESC').limit(n)
  end

  private

  def upcase_tag
    self.name = name.upcase
  end
end
