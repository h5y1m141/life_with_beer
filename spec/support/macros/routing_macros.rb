module RoutingMacros
  extend ActiveSupport::Concern

  module ClassMethods
    def it_routes_to(method, path, action, params = {})
      it "route #{method.upcase} #{path} to ##{action.split('#').last}" do
        expect(method => path).to route_to(action, params)
      end
    end
  end
end

RSpec.configure do |config|
  config.include RoutingMacros, type: :routing
end
