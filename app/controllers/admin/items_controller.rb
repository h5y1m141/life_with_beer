class Admin::ItemsController < AdminController
  include ItemSearchModule
  before_action :set_item, only: [:edit, :destroy, :update]
  before_action :reset_tags, only: [:update]

  def new
    @item = Item.new
  end

  def index
    @search = search_items_by_parameters(params[:q])
    @items = @search.result.all.page(params[:page]).per(params[:per_page])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice: "#{@item.name}を作成しました"
    else
      redirect_to admin_items_path, alert: "#{@item.name}の作成が行えませんでした"
    end
  end
  def edit
    if(@item.tags.count == 0)
      @item.tags.build
    else
      @item
    end
  end

  def update
    params[:item][:tags_attributes] = params[:item][:tag_names].split(",").map{|tag_name| { name: tag_name } } unless params[:item][:tag_names].empty?
    params[:item].delete(:tag_names)
    if @item.update(item_params)
      redirect_to admin_items_path, notice: '更新が完了しました'
    else
      redirect_to edit_admin_item(@item), notice: '更新できません'
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_path, notice: "#{@item.name}を削除しました"
  end

  def search_by_tag
    tags = item_params['tags'].split(",")
    @items = Item.fetch_by_tags(tags)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :url , :original_price, :discounted, :discount_price, :description, :image, :original_image_url, :ibu, :tag_names, tags_attributes: [:name])
  end

  def reset_tags
    @item.tags.delete_all
  end
end
