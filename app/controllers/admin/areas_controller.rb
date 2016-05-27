class Admin::AreasController < AdminController
  before_action :set_area, only: [:show, :places_belong_to_this_area]
  include PageCacheModule
  def index
    @areas = Area.all
  end
  def show

  end
  def places_belong_to_this_area
    @places = @area.places_belong_to_this_area
  end

  private

  def set_area
    @area = Area.find(params[:id])
  end
end
