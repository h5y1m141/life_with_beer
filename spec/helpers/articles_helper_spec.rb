describe ArticlesHelper, type: :helper do
  describe 'article_element_dataについて' do
    context 'sub_headが引数に渡された場合' do
      it 'H3タグが含まれるHTMLを生成する' do
        expect(helper.article_element_data('sub_head', 'text')).to eq '<h3>text</h3>'
      end
    end
    context 'descriptionが引数に渡された場合' do
      it 'Pタグが含まれるHTMLを生成する' do
        expect(helper.article_element_data('description', 'text')).to eq '<p>text</p>'
      end
    end
    context 'imgが引数に渡された場合' do
      let(:picture){ create(:picture)}
      it 'imgタグが含まれるHTMLを生成する' do
        expect(helper.article_element_data('img', picture.id)).to eq "<img class=\"img-responsive\" src=\"/uploads/picture/image/#{picture.id}/sample.jpg\" alt=\"Sample\" />"
      end
    end    
  end
end
