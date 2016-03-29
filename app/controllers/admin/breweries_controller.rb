class Admin::BreweriesController < AdminController
  include BrewerySearchModule
  before_action :set_brewery, only: [:edit, :destroy, :update]
  before_action :revise_params, only: [:create, :update]
  before_action :generate_social_account_list, only: [:new, :edit]
  def index
    @search = search_breweries_by_parameters(params[:q])
    @breweries = @search.result.all.page(params[:page]).per(params[:per_page])    
  end

  def new
    @brewery = Brewery.new
    @item = Item.new
  end

  def create
    @brewery = Brewery.new(brewery_params)
    if @brewery.save
      redirect_to admin_breweries_path, notice: "#{@brewery.name}を作成しました"
    else
      redirect_to admin_breweries_path, alert: "#{@brewery.name}の作成が行えませんでした"
    end
  end

  def edit
    @brewery_social_accounts = @brewery.social_accounts
  end

  def update
    if @brewery.update(brewery_params)
      redirect_to admin_breweries_path, notice: "#{@brewery.name}を更新しました"
    else
      redirect_to edit_admin_brewery_path, alert: "#{@brewery.name}を更新できませんでした"
    end
  end

  def destroy
    @brewery.destroy
    redirect_to admin_breweries_path, notice: "#{@brewery.name}を削除しました"
  end

  private

  def set_brewery
    @brewery = Brewery.find(params[:id])
  end

  def brewery_params
    params.require(:brewery).permit(:name, :web_site, :image,
      social_accounts_attributes: [:id, :account_type, :url, :comment]
    )
  end

  def generate_social_account_list
    # {"facebook"=>0, "twitter"=>1, "hatena"=>2・・という構造から
    # [{:index=>0, :name=>"facebook"}, {:index=>1, :name=>"twitter"}という構造に変更するために
    @social_accounts =[]
    SocialAccount.account_types.keys.each_with_index do|account, index|
      @social_accounts.push({index: index, name: account })
    end
    @social_accounts
  end

  def revise_params
    social_accounts = JSON.parse(params[:brewery][:social_accounts])
    unless social_accounts.first.empty?
      social_accounts_attributes = social_accounts.map{|account| { id: account['social_account_id'], account_type: account['index'], url: account['url'] }}
      params[:brewery][:social_accounts_attributes] = social_accounts_attributes
    end
  end
end
