class Clients::HackerNews

  attr_accessor :data

  def initialize
    conn = Faraday.new(:url => 'http://api.ihackernews.com')
    response = conn.get '/page'
    @data = JSON.parse(response.body)
  end

end
