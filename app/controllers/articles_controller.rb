class ArticlesController < ApplicationController
  include PageCacheModule
  before_action :set_article, only: [:show]
  before_filter :allow_page_caching, only: [:index, :show]
  protect_from_forgery except: [:index, :show]
  def index
    @articles = Article.published
  end


  def show
  end

  def new
    @article = Article.new
  end
  
  def preview
    @article = Article.find_by_preview_key(params[:preview_key])
    if(@article)
      return @article
    else
      render text: 'アクセスしたページは存在しません', status: 404
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
end
