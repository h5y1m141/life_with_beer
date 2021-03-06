class Admin::ArticlesController < AdminController
  include ArticleSearchModule
  include PlaceSearchModule
  before_action :set_article, only: [:edit, :destroy, :update, :load_elements]
  before_action :set_place_option, only: [:new, :edit]
  
  def index
    @search = search_articles_by_parameters(params[:q])
    @articles = @search.result.all.page(params[:page]).per(params[:per_page])
  end

  def new
    @search = search_places_by_parameters(params[:q])
    @article = Article.new
  end

  def create
    @article = Article.new(article_param)
    if @article.save
      @article
    else
      render json: {}, status: 400
    end
  end

  def edit
  end

  def update
    @article.elements.delete_all
    if @article.update(article_param)
      render action: :create
    else
      render json: {}, status: 400
    end
  end

  def load_elements
    if (@article)
      @article
    else
      render json: {}, status: 400
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit('title', 'publish_status','elements_attributes':['tag_name', 'element_data', 'sory_key'])
  end
  def set_place_option
    @prefectures = Place.prefectures
    @place_type_list = Place.place_type_list
    @areas = Area.all
  end
end
