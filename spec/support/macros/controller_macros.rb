module ControllerMacros
  extend ActiveSupport::Concern

  module ClassMethods
    def it_returns_http_status(status)
      it "HTTPステータス#{status}を返す" do
        request
        expect(response.status).to eq status
      end
    end

    def it_redirects_to_root
      it_redirects_to(:root)
    end

    def it_redirects_to(route)
      it "#{route}にリダイレクトさせる" do
        request
        expect(response).to redirect_to(route)
      end
    end

    def it_redirects_to_with_eval(route)
      it 'リダイレクトさせる' do
        request
        expect(response).to redirect_to eval(route)
      end
    end

    def it_renders_template(template)
      it "#{template}テンプレートを描画する" do
        request
        expect(response).to render_template(template)
      end
    end

    def it_assigns_a_new_record_to(as, clazz)
      it "@#{as}に新規の#{clazz}をセットする" do
        request
        expect(assigns(as)).to be_a_new(clazz)
      end
    end

    def it_assigns_an_instance_to(as, clazz)
      it "@#{as}に#{clazz}のインスタンスをセットする" do
        request
        expect(assigns(as)).to be_a_kind_of(clazz)
      end
    end

    def it_assigns_to(as, value, label = nil)
      description = label.blank? ? "@#{as}をセットする" : "@#{as}に#{label}をセットする"
      it description do
        request
        expect(assigns(as)).to eq eval(value)
      end
    end

    def it_raises_record_not_found
      it 'RecordNotFoundエラーを返す' do
        expect { request }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    def when_authenticated(&block)
      context 'ログイン済みの場合' do
        before do
          @request.env['devise.mapping'] = Devise.mappings[:user]
          sign_in(create(:user))
        end
      end.class_eval(&block)
    end

    def when_not_authenticated(&block)
      context '未ログインの場合' do
      end.class_eval(&block)
    end

    def with_valid_params(&block)
      context '有効な情報を入力した場合' do
      end.class_eval(&block)
    end

    def with_invalid_params(&block)
      context '無効な情報を入力した場合' do
      end.class_eval(&block)
    end
  end

  def current_user
    @controller.current_user
  end

  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end

RSpec.configure do |config|
  config.include ControllerMacros, type: :controller
end
