module ArticlesHelper
  def article_element_data(tag_type, contents)
    if(tag_type == 'img')
      picture = Picture.find(contents)
      image_tag picture.image.url, class: 'img-responsive'
    else
      elements = {
        sub_head: {
          actual_tag: :h3,
          raw_data: contents
        },
        description: {
          actual_tag: :p,
          raw_data: contents
        }
      }
      content_tag(elements[tag_type.to_sym][:actual_tag], elements[tag_type.to_sym][:raw_data])
    end
  end
end
