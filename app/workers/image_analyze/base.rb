require 'opencv'
require 'kmeans/pair'
require 'kmeans/pearson'
require 'kmeans/hcluster'
require 'kmeans/dendrogram'

class ImageAnalyze::Base < ApplicationController
  include OpenCV

  def initialize
    @base_directory = Rails.root.join('app', 'assets', 'images',@target[:english_name]).to_s
    @base_file = "#{@base_directory}/base.jpg"
    @result = []
    @threshold = 0.6
    @assign_tag = @target[:assign_tag]
    init_cv_histogram
  end
  
  def calcurate_similarity
    base = @hist.calc_hist([@gray])
    unless @items.empty?
      @items.each_with_index do |item, index|
        unless item.thumbnail.nil?
          image_path = "#{Rails.root.join}/public#{item.thumbnail.image.small_thumb.url}"
          iplimg1 =  IplImage.load(image_path)
          target = iplimg1.BGR2GRAY
          h2 = @hist.calc_hist([target])
          distance = OpenCV::CvHistogram.compare_hist(base, h2, 0)
          @result.push(item) if distance > @threshold
        end
      end
    end
  end
  def show
    @result
  end

  def update_item_with_tag
    @result.each do|item|
      tags = item.tags.pluck(:name)
      unless tags.include?(@assign_tag)
        tag = Tag.find_or_create_by(name: @assign_tag)
        item.tags.push(tag)
        item.save
      end
    end
  end

  private

  def init_cv_histogram
    iplimg = IplImage.load(@base_file)
    @gray = iplimg.BGR2GRAY
    dim = 1 
    size = [256]
    @hist = CvHistogram.new(dim, size, CV_HIST_ARRAY, [[0,255]])
  end
end
