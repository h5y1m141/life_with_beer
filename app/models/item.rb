# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  url            :string           not null
#  original_price :integer
#  discounted     :boolean
#  discount_price :integer
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Item < ActiveRecord::Base
  has_many :stocks, dependent: :delete_all
  has_many :pictures, dependent: :delete_all
  has_many :item_tag_relays, dependent: :destroy
  has_many :tags, through: :item_tag_relays
  belongs_to :store
  belongs_to :thumbnail, class_name: 'Picture', foreign_key: :thumbnail_id
  mount_uploader :image, PictureUploader
  accepts_nested_attributes_for :stocks
  accepts_nested_attributes_for :tags

  scope :fetch_by_tags, ->(tags) do
    includes(:tags).where('tags.name': tags )
  end

  def self.create_or_update_by_crawler(params)
    return false unless params[:url] && params[:images] && params[:stocks]
    pictures = self.prepare_pictures(params[:images], params[:url])
    item = Item.where(url: params[:url]).first_or_create(self.revised_parameter(params))
    if item.pictures.empty?
      item.pictures = pictures
      item.tap(&:save)
    end

    # 在庫のIDがパラメーターに含まれないため純粋な更新処理が出来ないので
    # 一度在庫を削除してから再度在庫を登録
    unless item.new_record?
      item.stocks.delete_all
      item.update(params)
    end
  end

  def self.prepare_pictures(image_path_list, url)
    result = []
    image_path_list.each do |image_url|
      # ページによっては画像が存在しないケースあるので対応
      RestClient.get(image_url) do |response|
        unless response.code == 404 || response.empty?
          picture = Picture.new
          picture.remote_image_url = image_url
          picture.width = picture.image.get_dimensions.first
          picture.height = picture.image.get_dimensions.last
          picture.original_picture_url = image_url
          result.push(picture) if picture.save
        end
      end
    end
    result
  end

  # Active Record Nested Attributesを利用するために一部キーを変更
  def self.revised_parameter(params)
    params[:stocks_attributes] = params[:stocks]
    params[:tags_attributes] = params[:tags]
    params.delete :images
    params.delete :stocks
    params.delete :tags
    params.merge({
      discounted: (params[:discounted] == "" || params[:discounted] == 0) ? false : true,
    })
  end
end
