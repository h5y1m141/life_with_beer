module Admin::BreweriesHelper
  def brewery_medium_logo(brewery)
    return brewery.image.try(:url) ? brewery.image.medium_thumb.url : 'logo/logo-medium.png'
  end

  def brewery_small_logo(brewery)
    return brewery.image.try(:url) ? brewery.image.small_thumb.url : 'logo/logo-small.png'
  end
end
