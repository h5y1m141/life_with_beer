describe ArticlesController, type: :controller do
  let(:draft_articles) { create_list(:article, 5) }
  let(:published_articles) { create_list(:article, 5, :published) }

  describe 'indexアクションについて' do
    let(:response) {get :index  }
    it_renders_template(:index)
    it 'ステータスが公開記事の一覧が取得できる' do
      draft_articles
      published_articles
      response
      expect(assigns(:articles).count).to eq published_articles.count
    end
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
