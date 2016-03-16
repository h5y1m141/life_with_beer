describe Admin::BreweriesController, type: :controller do
  let(:user) { create(:user) }
  let(:brewery) { create(:brewery) }
  before(:each) { login_user(user) }
  
  describe 'newアクションについて' do
    let(:request) { get :new}
    it_renders_template(:new)
  end

  describe 'editアクションについて' do
    let(:request) { get :edit, id: brewery.id }
    it_renders_template(:edit)
  end

  describe 'destroyアクションについて' do
    let(:request) { delete :destroy, id: brewery.id }
    it_returns_http_status(302)
    it_redirects_to('/admin/breweries')
  end
end
