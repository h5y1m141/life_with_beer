class StaticPagesController < ApplicationController
  caches_page :index
  def index
    @tags = Tag.all
    @articles = Article.limit(4)
  end
end
