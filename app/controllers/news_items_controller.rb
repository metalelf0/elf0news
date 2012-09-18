class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.all
    @scores = NewsItem.pluck(:score)
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end

  def new
    @news_item = NewsItem.new
  end

  def create
    @news_item = NewsItem.new(params[:news_item])
    if @news_item.save
      redirect_to @news_item, :notice => "Successfully created news item."
    else
      render :action => 'new'
    end
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def update
    @news_item = NewsItem.find(params[:id])
    if @news_item.update_attributes(params[:news_item])
      redirect_to @news_item, :notice  => "Successfully updated news item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @news_item = NewsItem.find(params[:id])
    @news_item.destroy
    redirect_to news_items_url, :notice => "Successfully destroyed news item."
  end

  def fetch
    client = Clients::HackerNews.new
    updated_items = NewsItemFactory.new.create_from(client.data)
    puts "~~~~~~ #{updated_items}"
    if updated_items > 0
      redirect_to news_items_path, :notice => "Successfully read news items."
    else
      redirect_to news_items_path, :alert => "Unable to update news items, try again later."
    end
  end

  def destroy_all
    @news_items = NewsItem.all
    @news_items.each { |ni| ni.destroy }
    redirect_to news_items_url, :notice => "Successfully destroyed all news items."
  end
end
