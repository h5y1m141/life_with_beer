module PlaceSearchModule
  def search_places_by_parameters(query_parameter)
    Place.includes(:items)
      .order("updated_at DESC")
      .ransack(query_parameter)
  end  
end
