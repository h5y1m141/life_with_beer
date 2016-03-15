class Picture < ActiveRecord::Base
  belongs_to :item
  mount_uploader :image, PictureUploader
end
