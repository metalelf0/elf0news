require File.dirname(__FILE__) + '/../spec_helper'

describe NewsItemsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => NewsItem.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    NewsItem.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    NewsItem.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(news_item_url(assigns[:news_item]))
  end

  it "edit action should render edit template" do
    get :edit, :id => NewsItem.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    NewsItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => NewsItem.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    NewsItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => NewsItem.first
    response.should redirect_to(news_item_url(assigns[:news_item]))
  end

  it "destroy action should destroy model and redirect to index action" do
    news_item = NewsItem.first
    delete :destroy, :id => news_item
    response.should redirect_to(news_items_url)
    NewsItem.exists?(news_item.id).should be_false
  end
end
