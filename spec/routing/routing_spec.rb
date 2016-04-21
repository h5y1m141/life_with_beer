describe StaticPagesController, type: :routing do
  describe 'Routing' do
    it_routes_to(:get, '/', 'static_pages#index')
    it_routes_to(:get, '/about', 'static_pages#about')
  end
end

describe ItemsController, type: :routing do
  describe 'Routing' do
    it_routes_to(:get, '/items', 'items#index')
    it_routes_to(:post, '/items', 'items#create')
    it_routes_to(:get, '/items/1', 'items#show', id: '1')
    it_routes_to(:get, '/items/new', 'items#new')
    it_routes_to(:put, '/items/1', 'items#update', id: '1')
    it_routes_to(:delete, '/items/1', 'items#destroy', id: '1')
    it_routes_to(:get, '/items/1/edit', 'items#edit', id: '1')
  end
end

describe ArticlesController, type: :routing do
  it_routes_to(:get, '/items', 'items#index')
  it_routes_to(:get, '/items/1', 'items#show', id: '1')
  it_routes_to(:get, '/articles/preview/1', 'articles#preview', preview_key: '1')
end

describe TagsController, type: :routing do
  it_routes_to(:get, '/tags', 'tags#index')
  it_routes_to(:get, '/tags/1', 'tags#show', id: '1')
end
