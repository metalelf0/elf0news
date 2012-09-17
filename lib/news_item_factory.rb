class NewsItemFactory

  def initialize
  end

  def create_from json_data
    json_data['items'].each do |item|
      news_item = NewsItem.find_or_create_by_original_id(item['id'])
      news_item.update_attributes(:title => item['title'], :score => item['points'], :url => item['url'])
    end
  end

end
