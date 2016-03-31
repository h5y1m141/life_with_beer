class Admin::PlacesController < AdminController
  include PlaceSearchModule
  before_action :set_place, only: [:edit, :destroy, :update]
  before_action :set_place_option, only: [:index, :new, :edit]

  def new
    @place = Place.new
  end

  def index
    @search = search_places_by_parameters(params[:q])
    @places = @search.result.all.page(params[:page]).per(params[:per_page])
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
    params.require(:place).permit(:name, :prefecture_id,:address, :address2, :phone_number, :latitude, :longitude, :place_type)
  end

  def set_place_option
    @prefectures = Place.prefectures
    @place_type_list = Place.place_type_list
  end
end
