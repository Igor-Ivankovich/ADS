require 'rails_helper'

describe InterfacesController do
  context 'resources' do
    it '#index' do
      expect(get: '/interfaces').to route_to(
                                 controller: 'interfaces', action: 'index')
    end
  end
end

