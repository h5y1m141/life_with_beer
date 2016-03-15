class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all
  end

  def show
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
