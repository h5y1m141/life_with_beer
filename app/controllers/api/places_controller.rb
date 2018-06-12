module Api
  class PlacesController < Api::ApplicationController
    def index
      @places = Place.all.page(params[:page]).per(params[:per_page])
      respond_to do |format|
        format.json
      end
    end
  end
end
