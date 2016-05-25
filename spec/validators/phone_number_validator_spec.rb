describe PhoneNumberValidator do
  let(:model_class) do
    Struct.new(:phone_number) do
      include ActiveModel::Validations

      def self.name
        'DummyModel'
      end
      validates :phone_number, phone_number: true
    end
  end

  describe 'validate_each' do
    context '値が妥当な場合' do
      let(:include_dash) { model_class.new('03-1234-5678') }
      let(:without_dash) { model_class.new('0312345678') }
      let(:cellular_phone) { model_class.new('090-1111-2222') }
      let(:cellular_phone_without_dash) { model_class.new('09011112222') }
      let(:start_with_three_digts) { model_class.new('042-234-5678') }
      it 'validが得られる' do
        expect(include_dash).to be_valid
        expect(without_dash).to be_valid
        expect(cellular_phone).to be_valid
        expect(cellular_phone_without_dash).to be_valid
        expect(start_with_three_digts).to be_valid
      end
    end
    context '値が適切でない場合' do
      let(:str) { model_class.new('this is a text') }
      let(:double_byte_phone_number) { model_class.new('０３ー００００ー００００') }
      it 'invalid:テキストである' do
        expect(str).not_to be_valid
      end
      it 'invalid:全角数字' do
        expect(double_byte_phone_number).not_to be_valid
      end
    end
  end
end
