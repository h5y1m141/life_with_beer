class AreasController < ApplicationController
  include PageCacheModule
  def index
    @areas = Area.all
  end
  def show
    @area = Area.find(params[:id])
  end
end
