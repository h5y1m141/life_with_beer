describe Admin::ItemsController, type: :routing do
  it_routes_to(:get, '/admin/items/new', 'admin/items#new')
  it_routes_to(:get, '/admin/items', 'admin/items#index')
  it_routes_to(:get, '/admin/items/1/edit', 'admin/items#edit', id: '1')
  it_routes_to(:patch, '/admin/items/1', 'admin/items#update', id: '1')
  it_routes_to(:delete, '/admin/items/1', 'admin/items#destroy', id: '1')
  it_routes_to(:post, '/admin/items/search_by_tag.json', 'admin/items#search_by_tag', format: 'json' )
  it_routes_to(:post, '/admin/items/search_by_brewery.json', 'admin/items#search_by_brewery', format: 'json' )
  it_routes_to(:post, '/admin/items', 'admin/items#create')
end

describe Admin::ArticlesController, type: :routing do
  it_routes_to(:get, '/admin/articles/new', 'admin/articles#new')
  it_routes_to(:get, '/admin/articles', 'admin/articles#index')
  it_routes_to(:get, '/admin/articles/1/edit', 'admin/articles#edit', id: '1')
  it_routes_to(:patch, '/admin/articles/1', 'admin/articles#update', id: '1')
  it_routes_to(:delete, '/admin/articles/1', 'admin/articles#destroy', id: '1')
  it_routes_to(:post, '/admin/articles.json', 'admin/articles#create', format: 'json' )
  it_routes_to(:post, '/admin/articles/load_elements.json', 'admin/articles#load_elements', format: 'json' )
end

describe Admin::BreweriesController, type: :routing do
  it_routes_to(:get, '/admin/breweries/new', 'admin/breweries#new')
  it_routes_to(:get, '/admin/breweries', 'admin/breweries#index')
  it_routes_to(:get, '/admin/breweries/1/edit', 'admin/breweries#edit', id: '1')
  it_routes_to(:patch, '/admin/breweries/1', 'admin/breweries#update', id: '1')
  it_routes_to(:delete, '/admin/breweries/1', 'admin/breweries#destroy', id: '1')
  it_routes_to(:post, '/admin/breweries.json', 'admin/breweries#create', format: 'json' )
end

describe Admin::PicturesController, type: :routing do
  it_routes_to(:get, '/admin/pictures/new', 'admin/pictures#new')
  it_routes_to(:get, '/admin/pictures', 'admin/pictures#index')
  it_routes_to(:get, '/admin/pictures/1/edit', 'admin/pictures#edit', id: '1')
  it_routes_to(:patch, '/admin/pictures/1', 'admin/pictures#update', id: '1')
  it_routes_to(:delete, '/admin/pictures/1', 'admin/pictures#destroy', id: '1')
  it_routes_to(:post, '/admin/pictures.json', 'admin/pictures#create', format: 'json' )
end

describe Admin::PlacesController, type: :routing do
  it_routes_to(:get, '/admin/places/new', 'admin/places#new')
  it_routes_to(:post, '/admin/places', 'admin/places#create')
  it_routes_to(:get, '/admin/places', 'admin/places#index')
  it_routes_to(:get, '/admin/places/1/edit', 'admin/places#edit', id: '1')
  it_routes_to(:patch, '/admin/places/1', 'admin/places#update', id: '1')
  it_routes_to(:delete, '/admin/places/1', 'admin/places#destroy', id: '1')  
end
