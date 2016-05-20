class Admin::BeerStylesController < AdminController
  def index
    @beer_styles = BeerStyle.all
  end
end
