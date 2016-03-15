class ImageAnalyze::BorderPrint < ImageAnalyze::Base
  def initialize
    @target = target = {
      english_name: 'border_print',
      assign_tag: '横ボーダー'
    }
    @items = Item.fetch_by_tags('帽子')
    super
  end

  def calcurate_similarity
    super
  end

  def show
    super
  end
end
