class NewsController < ApplicationController
  before_action :load_news
  
  def index
    @news = News.all 
  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new 
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def load_news 
    @news = News.all
  end


end