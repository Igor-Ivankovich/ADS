require 'rails_helper'

describe AdmincasController do
  context 'resources' do
    it '#index' do
      expect(get: '/admin/admincas').to route_to(
                                      controller: 'admincas', action: 'index')
    end
  end
end


