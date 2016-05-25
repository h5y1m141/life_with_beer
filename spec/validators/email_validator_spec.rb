describe EmailValidator do
  let(:model_class) do
    Struct.new(:email) do
      include ActiveModel::Validations

      def self.name
        'DummyModel'
      end
      validates :email, email: true
    end
  end

  describe 'validate_each' do
    context '値が妥当な場合' do
      let(:email) { 'h5y1m141@gmail.com'}
      let(:result) { model_class.new(email) }
      it 'validが得られる' do
        expect(result).to be_valid
      end
    end
    context '値が適切でない場合' do
      let(:email) { 'h5y1m141gmail.com'}
      let(:result) { model_class.new(email) }
      it 'invalid:アットマークが含まれてない' do
        expect(result).not_to be_valid
      end
    end
  end
end
