class NewsItem < ActiveRecord::Base
  attr_accessible :score, :title, :url, :points, :original_id

  default_scope :order => "score DESC"
end
