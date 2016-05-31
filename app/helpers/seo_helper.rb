module SeoHelper
  def canonical_url
  end

  def page_description
    t("meta.description.#{controller_name}.#{action_name}")
  end

  def page_og_image
    image_path('tumblr.png') 
  end

  def page_keywords
    t("meta.keywords.#{controller_name}.#{action_name}")
  end

  def page_title
    t("meta.title.#{controller_name}.#{action_name}")
  end
end
