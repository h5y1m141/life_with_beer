class StaticPagesController < ApplicationController
  def index
    @tags = Tag.all
    @articles = Article.limit(4)
  end
end
