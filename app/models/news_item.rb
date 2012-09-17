class NewsItem < ActiveRecord::Base
  attr_accessible :score, :title, :url, :points, :original_id
end
