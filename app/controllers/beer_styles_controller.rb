class BeerStylesController < ApplicationController
  before_action :set_beer_style, only: [:show]

  def index
    @beer_styles = BeerStyle.all
  end

  def show
  end
  
  private
  
  def set_beer_style
    @beer_style = BeerStyle.find(params[:id])
  end
end
