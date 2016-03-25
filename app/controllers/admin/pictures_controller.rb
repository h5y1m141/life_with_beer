class Admin::PicturesController < AdminController
  before_action :set_picture, only: [:edit, :destroy, :update, :load_elements]
  
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.image_source(params[:file])
    if @picture.save
      @picture
    else
      render json: {}, status: 400
    end
  end

  def edit
  end
  
  def destroy
    @picture.destroy
    redirect_to admin_pictures_path, notice: "#{@picture.name}を削除しました"
  end
  
  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_param
    params.permit(:image, :original_picture_url)
  end
end
