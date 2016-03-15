class Admin::ItemsController < AdminController
  include ItemSearchModule
  before_action :set_item, only: [:edit, :destroy, :update]
  before_action :reset_tags, only: [:update]
  def index
    @search = search_items_by_parameters(params[:q])
    @items = @search.result.all.page(params[:page]).per(params[:per_page])
  end

  def edit
    if(@item.tags.count == 0)
      @item.tags.build
    else
      @item
    end
  end

  def update
    thumbnail_id = JSON.parse(params[:thumbnail])['id']
    tag_values = params[:tags].split(",").map{|tag_name| { name: tag_name } }
    updat_params = {
      thumbnail_id: thumbnail_id,
      tags_attributes: tag_values
    }
    if @item.update(updat_params)
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
    params.require(:item).permit(:name, :url , :original_price, :discounted, :discount_price, :description, :tags)
  end

  def reset_tags
    @item.tags.delete_all
  end
end
