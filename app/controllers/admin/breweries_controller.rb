class Admin::BreweriesController < AdminController
  include BrewerySearchModule
  before_action :set_brewery, only: [:edit, :destroy, :update]
  
  def index
    @search = search_breweries_by_parameters(params[:q])
    @breweries = @search.result.all.page(params[:page]).per(params[:per_page])    
  end
  
  def new
    @brewery = Brewery.new
  end
  
  def create
    @brewery = Brewery.new(brewery_param)
    if @brewery.save
      @brewery
    else
      render json: {}, status: 400
    end    
  end

  def edit
  end

  def update
  end

  def destroy
    @brewery.destroy
    redirect_to admin_breweries_path, notice: "#{@brewery.name}を削除しました"
  end
  
  private

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end

  def brewery_param
    params.require(:brewery).permit(:name)
  end  
end
