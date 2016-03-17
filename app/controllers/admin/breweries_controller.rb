class Admin::BreweriesController < AdminController
  include BrewerySearchModule
  before_action :set_brewery, only: [:edit, :destroy, :update]
  
  def index
    @search = search_breweries_by_parameters(params[:q])
    @breweries = @search.result.all.page(params[:page]).per(params[:per_page])    
  end
  
  def new
    @brewery = Brewery.new
    @social_accounts = generate_social_account_list
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
    params.require(:brewery).permit(:name, :web_site)
  end  

  def generate_social_account_list
    # {"facebook"=>0, "twitter"=>1, "hatena"=>2・・という構造から
    # [{:index=>0, :name=>"facebook"}, {:index=>1, :name=>"twitter"}という構造に変更するために
    list =[]
    SocialAccount.account_types.keys.each_with_index do|account, index|
      list.push({index: index, name: account })
    end
    return list
  end
end
