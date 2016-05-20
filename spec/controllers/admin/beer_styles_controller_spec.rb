describe Admin::BeerStylesController, type: :controller do
  let(:user) { create(:user) }
  let(:beer_styles) { create_list(:beer_style, 5) }
  before(:each) { login_user(user) }

  describe 'indexアクションについて' do
    let(:request) { get :index }
    it_renders_template(:index)
    it 'テストデーターが確認できる' do
      expect(beer_styles.count).to eq 5
    end
  end
end
