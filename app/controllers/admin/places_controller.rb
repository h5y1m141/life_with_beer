class Admin::PlacesController < AdminController
  include PlaceSearchModule

  before_action :set_place, only: [:edit, :destroy, :update]
  before_action :revise_params, only: [:create, :update]

  def new
    @place = Place.new
  end

  def index
    @search = search_places_by_parameters(params[:q])
    @places = @search.result.all.page(params[:page]).per(params[:per_page])
    @prefectures = Place.prefectures
    @place_type_list = Place.place_type_list
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to admin_places_path, notice: "#{@place.name}を作成しました"
    else
      redirect_to admin_places_path, alert: "#{@place.name}の作成が行えませんでした"
    end
  end
  def edit
    if(@place.tags.count == 0)
      @place.tags.build
    else
      @place
    end
  end

  def update
    if @place.update(place_params)
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
    params.require(:place).permit(:name, :url , :original_price, :discounted, :discount_price, :description, :image, :original_image_url, :ibu, :tag, :brewery, :tag_names, tags_attributes: [:name])
  end

  def reset_tags
    @place.tags.delete_all
  end

  def revise_params
    unless params[:place][:tag_names].empty?
      tags_attributes = params[:place][:tag_names].split(",").map{|tag_name| { name: tag_name } }
      params[:place][:tags_attributes] = tags_attributes
    end
    params[:place].delete(:tag_names)
  end
end
