describe BlogEngine::ArticlesController, type: :controller do
  routes { BlogEngine::Engine.routes }
  describe "GET /articles" do
    it "works! (now write some real specs)" do
      get :index
      create(:blog_engine_article)
      expect(response).to have_http_status(200)
    end
  end
end
