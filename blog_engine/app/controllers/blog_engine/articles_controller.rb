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
      @article = Article.new(title: params[:title], body: params[:body])
      if @article.save
        render action: :show, json: @article
      else
        render json: { title: nil, body: nil }
      end
    end

    def update
      if @article.update(title: params[:title], body: params[:body])
        render action: :show, json: @article
      else
        render json: { title: nil, body: nil }
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
      def set_article
        @article = Article.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :body)
      end
  end
end
