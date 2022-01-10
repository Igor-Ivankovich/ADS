require 'rails_helper'


describe UsersController do
  context 'resources' do
    it '#index' do
      expect(get: '/users').to route_to(
                                 controller: 'users', action: 'index')
    end

    it '#show' do
      expect(get: '/users/1').to route_to(
                                   controller: 'users', action: 'show', id: '1')
    end

    it '#edit' do
      expect(get: '/users/1/edit').to route_to(
                                        controller: 'users', action: 'edit', id: '1')
    end

    it '#update' do
      expect(put: '/users/1').to route_to(
                                   controller: 'users', action: 'update', id: '1')
    end

    it '#new' do
      expect(get: '/users/sign_up').not_to route_to(
                                         controller: 'sign_up', action: 'new')
    end

    it '#create' do
      expect(post: '/users').not_to route_to(
                                      controller: 'users', action: 'create')
    end

    it '#destroy' do
      expect(delete: '/users/1').to route_to(
                                      controller: 'users', action: 'destroy', id: '1')
    end
  end
end