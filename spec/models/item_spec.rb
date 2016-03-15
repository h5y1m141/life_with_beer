describe Item, type: :model do
  let(:items) { create_list(:item, 5) }
  let(:tags) { %w(帽子 キャップ ワークキャップ).map {|tag_name| create(:tag, name: tag_name) }}
  let(:set_tags) {items.first.tags.push(tags) }
  let(:inhabitant_items) {create_list(:item, 5) }

  describe 'fetch_by_tagsについて' do
    it '帽子というタグがついたアイテムが取得できる' do
      set_tags
      expect(Item.fetch_by_tags('帽子').count).to eq 1
    end
    it '存在しないタグを指定した場合にはアイテムの取得件数は0になる' do
      set_tags
      expect(Item.fetch_by_tags('明らかに存在しないタグ').count).to eq 0
    end
  end

  describe 'create_or_update_by_crawlerについて' do
    let(:params) do
      {
        name: 'Booby Multi Hard Case L',
        images: [
          'http://www.goout.jp/client_info/GOOUT/itemimage/ch621006-d01b.jpg',
          'http://www.goout.jp/client_info/GOOUT/itemimage/ch621006-d02b.jpg'
        ],
        url: 'http://www.goout.jp/category/B001012/CH621006.html',
        description: 'ランタンやガス缶を入れるのに便利なラージサイズのハードケース',
        original_price: 4212,
        discount_price: nil,
        discounted: false,
        store_id: 1,
        stocks: [{size: 'F', color: 'レッド(09)', in_stock: true}],
        tags: [{name: '小物'}, {name: 'PCケース・その他ケース'}]
      }
    end
    it 'パラメータの情報を元にして新規にアイテムが作成できる' do
      result = Item.create_or_update_by_crawler(params)
      item = Item.last
      expect(result).to be true
      expect(item[:name]).to eq 'Booby Multi Hard Case L'
      expect(item.stocks.first.size).to eq 'F'
      expect(item.tags.first.name).to eq '小物'
    end
  end
end
