describe ArticlesController, type: :controller do
  describe 'indexアクションについて' do
    let(:response) {get :index  }
    it_renders_template(:index)
  end

  describe 'showアクションについて' do
    let(:article) { create(:article) }
    let(:request) { get :show, id: article.id }
    it_renders_template(:show)
  end

  describe 'previewアクションについて' do
    describe 'preview_keyが妥当な場合' do
      let(:article) { create(:article) }
      let(:request) { get :preview, preview_key: article.preview_key }
      it_renders_template(:preview)
      it_returns_http_status(200)
    end
    describe '存在しないpreview_keyが渡された場合' do
      let(:request) { get :preview, preview_key: 'test' }
      it_returns_http_status(404)
    end
  end
end
