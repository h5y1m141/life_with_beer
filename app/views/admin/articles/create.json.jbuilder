json.cache! ['v1', @article[:updated_at]], expires_in: 10.minutes do
  json.title @article.title
  json.publish_status @article.publish_status
  json.elements do
    if @article.elements.length > 0
      json.array! @article.elements do |element|
        json.tag_name element.tag_name
        json.element_data element.element_data
      end
    end
  end
end
