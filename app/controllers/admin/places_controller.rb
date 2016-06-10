class Admin::PlacesController < AdminController
  include PlaceSearchModule
  include SocialAccountSearchModule
  before_action :set_place, only: [:show, :edit, :destroy, :update]
  before_action :set_place_option, only: [:index, :new, :edit]
  before_action :revise_params, only: [:create, :update]
  before_action :generate_social_account_list, only: [:new, :edit]

  def new
    @place = Place.new
  end

  def show
    respond_to do |format|
      format.json {render json: @place}
    end
  end

  def index
    query_params = (request[:format] == 'json') ? JSON.parse(params['q']) : params[:q]
    @search = search_places_by_parameters(query_params)
    @places = @search.result.all.page(params[:page]).per(params[:per_page])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @place = Place.new(place_params.merge(place_type: place_params['place_types'].to_i))
    if @place.save
      redirect_to admin_places_path, notice: "#{@place.name}を作成しました"
    else
      redirect_to admin_places_path, alert: "#{@place.name}の作成が行えませんでした"
    end
  end
  
  def edit
    @place_social_accounts = @place.social_accounts
  end

  def update
    if @place.update(place_params.merge(place_type: place_params['place_types'].to_i))
      redirect_to admin_places_path, notice: '更新が完了しました'
    else
      redirect_to edit_admin_place(@place), notice: '更新できません'
    end
  end

  def destroy
    @place.destroy
    redirect_to admin_places_path, notice: "#{@place.name}を削除しました"
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(
      :name, :prefecture_id,:address, :address2, :phone_number, :latitude, :longitude, :place_type,
      social_accounts_attributes: [:id, :account_type, :url, :comment]
    )
  end

  def set_place_option
    @prefectures = Place.prefectures
    @place_type_list = Place.place_type_list
  end
  
  def revise_params
    social_accounts = JSON.parse(params[:place][:social_accounts])
    unless social_accounts.first.empty?
      social_accounts_attributes = social_accounts.map{|account| { id: account['social_account_id'], account_type: account['index'], url: account['url'] }}
      params[:place][:social_accounts_attributes] = social_accounts_attributes
    end
  end  
end
