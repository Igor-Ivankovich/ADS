require 'rails_helper'


describe TagsController do
  context 'resources' do
    it '#index' do
      expect(get: '/tags').to route_to(
                                 controller: 'tags', action: 'index')
    end

    it '#show' do
      expect(get: '/tags/1').to route_to(
                                   controller: 'tags', action: 'show', id: '1')
    end

    it '#edit' do
      expect(get: '/tags/1/edit').to route_to(
                                        controller: 'tags', action: 'edit', id: '1')
    end

    it '#update' do
      expect(put: '/tags/1').to route_to(
                                   controller: 'tags', action: 'update', id: '1')
    end

    it '#new' do
      expect(get: '/tags/new').not_to route_to(
                                             controller: 'tags/', action: 'new')
    end

    it '#create' do
      expect(post: '/tags').not_to route_to(
                                      controller: 'tags/', action: 'create')
    end

    it '#destroy' do
      expect(delete: '/tags/1').to route_to(
                                      controller: 'tags', action: 'destroy', id: '1')
    end
  end
end
