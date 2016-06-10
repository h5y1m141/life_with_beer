class StaticPagesController < ApplicationController
  include PageCacheModule
  before_filter :allow_page_caching, only: [:index]
  protect_from_forgery except: [:index]
  def index
    @tags = Tag.all
    @articles = Article.limit(4)
  end

  def about
  end
end
