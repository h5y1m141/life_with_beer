module ArticlesHelper
  def article_element_data(tag_type, contents)
    if(tag_type == 'img')
      picture = Picture.find(contents)
      image_tag picture.image.url, class: 'img-responsive'
    elsif(tag_type == 'item')
      @item = Item.find(contents.to_i)
      render partial: 'items/item_summary', locals: { item:  @item }
    elsif(tag_type == 'place')
      @place = Place.find(contents.to_i)
      render partial: 'places/place_summary', locals: { place:  @place }
    elsif(tag_type == 'area')
      @area = Area.find(contents.to_i)
      render partial: 'areas/area_summary', locals: { area: @area }
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
