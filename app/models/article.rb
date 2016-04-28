class Article < ActiveRecord::Base
  has_many :elements, class_name: ArticleElement.name, dependent: :destroy
  has_many :favorites, as: :favoriteable
  has_many :article_picture_relays, dependent: :destroy
  has_many :pictures, through: :article_picture_relays

  accepts_nested_attributes_for :elements
  mount_uploader :thumbnail, PictureUploader

  validates :title, presence: true
  enum publish_status: { draft: 0, published: 1 }
  after_create :generate_preview_key

  def generate_preview_key
    token = SecureRandom.urlsafe_base64(20, false)
    preview_key = Digest::MD5.hexdigest(self.created_at.to_s + token)
    self.preview_key = preview_key
    self.save
  end
end
