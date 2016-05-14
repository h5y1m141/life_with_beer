module PageCacheModule
  # 以下参考に実装
  # https://mattbrictson.com/nginx-reverse-proxy-cache
  def allow_page_caching
    expires_in(5.minutes) unless Rails.env.development?
  end
end
