require_dependency "blog_engine/application_controller"

module BlogEngine
  class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = Article.all
    end

    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        render json: { id: @article.id, title: @article.title, body: @article.body }
      else
        render json: { title: nil, body: nil }
      end
    end

    def update
      if @article.update(article_params)
        render json: { id: @article.id, title: @article.title, body: @article.body }
      else
        render json: { title: nil, body: nil }
      end
    end

    def destroy
      if @article.destroy
        render json: { success: true }
      else
        render json: { success: false }
      end
    end

    private
      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.permit(:title, :body)
      end
  end
end
