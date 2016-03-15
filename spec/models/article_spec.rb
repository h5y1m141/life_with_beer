describe Article, type: :model do
  # Shoulda Callback Matchersは以下を参照
  # https://github.com/beatrichartz/shoulda-callback-matchers/wiki
  context '記事作成後について' do
    let (:article) {create(:article)}
    it '下書きページアクセス用のpreview_key生成のメソッドが呼ばれる' do
      expect(article).to callback(:generate_preview_key).after(:create) 
    end
  end
end
