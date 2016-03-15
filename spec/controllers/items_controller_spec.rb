describe ItemsController do
  describe "indexアクションについて" do
    let(:request) { get :index }
    it_renders_template(:index)
  end

  describe "showアクションについて" do
    let(:request) { get :show, id: 1 }
    it_renders_template(:show)
  end

  describe "editアクションについて" do
    let(:request) { get :edit, id: 1 }
    it_renders_template(:edit)
  end

  describe "destroyアクションについて" do
    let(:request) { delete :destroy, id: 1 }
    it_returns_http_status(200)
  end

  describe "createアクションについて" do
    let(:request) { post :create }
    it_returns_http_status(200)
  end

  describe "updateアクションについて" do
    let(:request) { put :update, id: 1 }
    it_returns_http_status(200)
  end
end
