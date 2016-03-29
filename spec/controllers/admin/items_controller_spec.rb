describe Admin::ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item, :coedo) }
  let(:off_sale_items) { create_list(:item, 2, :off_sale) }
  let(:low_price_items) { create_list(:item, 2, :low_price) }
  let(:items) { off_sale_items; low_price_items }
  before(:each) { login_user(user) }

  describe 'newアクションについて' do
    let(:request) { get :new}
    it_renders_template(:new)
  end

  describe 'indexアクションについて' do
    let(:request_without_parameter) { get :index, q: {}  }
    let(:request_with_parameter) { get :index, q: { original_price_gteq: 1000} }
    before(:each) { items }
    context '検索パラメータが空白の場合' do
      it '@searchに検索結果がセットされる' do
        request_without_parameter
        expect(assigns(:search).result.all.empty?).to eq false
      end
    end
    context '検索パラメータに条件を指定した場合' do
      it '@searchに検索結果がセットされる' do
        request_with_parameter
        expect(assigns(:search).result.all.empty?).to eq false
      end
    end
  end

  describe 'editアクションについて' do
    let(:request) { get :edit, id: item.id }
    it_renders_template(:edit)
  end

  describe 'updateアクションについて' do
    let(:response) { put :update, { id: item.id, item: {name: 'Stone', tag_names: 'IPA, Stone'}} }
    it 'nameが更新される' do
      expect(item.name).to eq 'COEDO'
      response
      item.reload
      expect(item.name).to eq 'Stone'
    end
    it_returns_http_status(302)
    it_redirects_to('/admin/items')
  end

  describe 'destroyアクションについて' do
    let(:request) { delete :destroy, id: item.id }
    it_returns_http_status(302)
    it_redirects_to('/admin/items')
  end
  describe 'search_by_tagアクションについて' do
    before(:each) do
      request.env['HTTP_ACCEPT'] = 'application/json'
    end
    describe '検索用のタグを引数に渡した場合' do
      let(:response) {post :search_by_tag , { item: {tag: 'IPA' }} }
      it_returns_http_status(200)
      it_renders_template(:search_by_tag)
    end
  end

  describe 'search_by_breweryアクションについて' do
    before(:each) do
      request.env['HTTP_ACCEPT'] = 'application/json'
    end
    describe '検索用のタグを引数に渡した場合' do
      let(:response) {post :search_by_brewery , { item: {brewery: 'COEDO' }} }
      it_returns_http_status(200)
      it_renders_template(:search_by_tag)
    end
  end

  describe 'createアクションについて' do
    before(:each) do
      request.env['HTTP_ACCEPT'] = 'application/json'
    end
    let(:response) {post :create , {item: {name: 'PunkIPA', url: 'http://brewdog', original_image_url: 'http://brewdog',   tag_names: 'IPA, Stone' } } }
    it_returns_http_status(302)
    it_redirects_to('/admin/items')
  end
end
