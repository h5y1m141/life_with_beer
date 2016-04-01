describe Admin::PlacesController, type: :controller do
  let(:user) { create(:user) }
  let(:place) { create(:place, :restaurant) }
  let(:places) { create_list(:place, 5, :restaurant) }
  let(:social_accounts) {'[{"index":1,"url":"https://twitter.com/twinswanlake"}]' }  
  before(:each) { login_user(user) }

  describe 'newアクションについて' do
    let(:request) { get :new}
    it_renders_template(:new)
  end

  describe 'createアクションについて' do
    before(:each) do
      request.env['HTTP_ACCEPT'] = 'application/json'
    end
    let(:place_params) { attributes_for(:place) }
    
    let(:response) {post :create, place: place_params.merge(social_accounts: social_accounts ) }
    it_returns_http_status(302)
    it_redirects_to('/admin/places')
  end

  describe 'indexアクションについて' do
    let(:request_without_parameter) { get :index, q: {}  }
    let(:request_with_parameter) { get :index, q: { prefecture_id_in: 13} }
    before(:each) { places }
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
    let(:request) { get :edit, id: place.id }
    it_renders_template(:edit)
  end

  describe 'updateアクションについて' do
    let(:response) { put :update, { id: place.id, place: {name: 'クラフトビールのレストラン', social_accounts: social_accounts }}}
    it 'nameが更新される' do
      expect(place.name).to eq 'ビールが飲めるお店'
      response
      place.reload
      expect(place.name).to eq 'クラフトビールのレストラン'
    end
    it_returns_http_status(302)
    it_redirects_to('/admin/places')
  end

  describe 'destroyアクションについて' do
    let(:request) { delete :destroy, id: place.id }
    it_returns_http_status(302)
    it_redirects_to('/admin/places')
  end
end
