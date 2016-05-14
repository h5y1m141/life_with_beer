describe Area, type: :model do
  # Shoulda Callback Matchersは以下を参照
  # https://github.com/beatrichartz/shoulda-callback-matchers/wiki
  context 'エリア作成後について' do
    let (:area) {create(:area)}
    it 'geohash生成のメソッドが呼ばれる' do
      expect(area).to callback(:generate_geohash).after(:create)
    end
  end
end
