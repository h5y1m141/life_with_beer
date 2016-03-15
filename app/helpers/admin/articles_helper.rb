module Admin::ArticlesHelper
  def preview_url(article)
    current_host = request.protocol + request.host_with_port
    return "#{current_host}/articles/preview/#{article.preview_key}"
  end
end
