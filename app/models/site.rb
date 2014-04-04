class Site < ActiveRecord::Base
  before_save :add_http

  belongs_to :user

  private

  def add_http
    attributes.each_pair do |name, value|
      unless name == 'user_id' || value.blank? || value =~ /^http:\/\// || value =~ /^https:\/\//
        self[name] = "http://#{value}"
      end
    end
  end
end
