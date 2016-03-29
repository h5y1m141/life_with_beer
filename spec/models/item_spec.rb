describe Item, type: :model do
  let(:items) { create_list(:item, 5) }
  let(:tags) { %w(スタウト ヴァイツェン).map {|tag_name| create(:tag, name: tag_name) }}
  let(:set_tags) {items.first.tags.push(tags) }
  let(:inhabitant_items) {create_list(:item, 5) }

  describe 'fetch_by_tagについて' do
    it 'スタウトというタグがついたアイテムが取得できる' do
      set_tags
      expect(Item.fetch_by_tag('スタウト').count).to eq 1
    end
    it '存在しないタグを指定した場合にはアイテムの取得件数は0になる' do
      set_tags
      expect(Item.fetch_by_tag('明らかに存在しないタグ').count).to eq 0
    end
  end
end
