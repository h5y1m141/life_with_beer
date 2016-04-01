describe Place, type: :model do
  describe 'place_type_listについて' do
    it 'place_typeの一覧が取得できる' do
      place_type_list = Place.place_type_list
      expect(place_type_list[0].first).to eq 'restaurant'
      expect(place_type_list[1].first).to eq 'shop'
      expect(place_type_list[2].first).to eq 'place'
    end
  end
  describe 'prefecturesについて' do
    it '都道府県一覧情報が得られる' do
      hokkaido_prefecture = Place.prefectures.first
      expect(hokkaido_prefecture.first).to eq '北海道'
      expect(hokkaido_prefecture.last).to eq 1
    end
  end
end
