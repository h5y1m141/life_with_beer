# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  version :small_thumb do
    process :resize_to_fit => [50, 50]
  end

  version :medium_thumb do
    process :resize_to_fit => [150, 150]
  end

  version :large_thumb do
    process :resize_to_fit => [300, 300]
  end

  def get_dimensions
    if file && model
      begin
        img = ::Magick::Image::read(file.file).first
        [img.columns, img.rows]
      rescue => e
        Rails.logger.error e.message
        Rails.logger.error e.backtrace.join("\n")
        # ファイル読み込みエラー時、サイズ0で返す
        [0, 0]
      end
    end
  end
end
