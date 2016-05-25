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
  belongs_to :brewery
  belongs_to :beer_style
  belongs_to :thumbnail, class_name: 'Picture', foreign_key: :thumbnail_id
  mount_uploader :image, PictureUploader
  accepts_nested_attributes_for :stocks
  accepts_nested_attributes_for :tags
  
  scope :fetch_by_tag, ->(tag) do
    includes(:tags).where('tags.name': tag )
  end

  scope :fetch_by_brewery, ->(brewery) do
    includes(:brewery).where('breweries.name': brewery)
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
