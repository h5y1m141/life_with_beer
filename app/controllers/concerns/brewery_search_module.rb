module BrewerySearchModule
  def search_breweries_by_parameters(query_parameter)
    Brewery.includes(:social_accounts)
      .order("updated_at DESC")
      .ransack(query_parameter)
  end  
end
