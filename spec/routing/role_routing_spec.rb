require 'rails_helper'


describe RolesController do
  context 'resources' do
    it '#index' do
      expect(get: '/roles').to route_to(
                                controller: 'roles', action: 'index')
    end

    it '#show' do
      expect(get: '/roles/1').to route_to(
                                  controller: 'roles', action: 'show', id: '1')
    end

    it '#edit' do
      expect(get: '/roles/1/edit').to route_to(
                                       controller: 'roles', action: 'edit', id: '1')
    end

    it '#update' do
      expect(put: '/roles/1').to route_to(
                                  controller: 'roles', action: 'update', id: '1')
    end

    it '#new' do
      expect(get: '/roles/new').not_to route_to(
                                            controller: 'roles/', action: 'new')
    end

    it '#create' do
      expect(post: '/roles').not_to route_to(
                                     controller: 'roles/', action: 'create')
    end

    it '#destroy' do
      expect(delete: '/roles/1').to route_to(
                                     controller: 'roles', action: 'destroy', id: '1')
    end
  end
end

