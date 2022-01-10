require 'rails_helper'

describe PostsController do
  context 'resources' do
    it '#index' do
      expect(get: '/posts').to route_to(
                                 controller: 'posts', action: 'index')
    end

    it '#new' do
      expect(get: '/posts/new').to route_to(
                                     controller: 'posts', action: 'new')
    end

    it '#show' do
      expect(get: '/posts/1').to route_to(
                                   controller: 'posts', action: 'show', id: '1')
    end

    it '#edit' do
      expect(get: '/posts/1/edit').to route_to(
                                        controller: 'posts', action: 'edit', id: '1')
    end

    it '#create' do
      expect(post: '/posts').to route_to(
                                  controller: 'posts', action: 'create')
    end

    it '#update' do
      expect(put: '/posts/1').to route_to(
                                   controller: 'posts', action: 'update', id: '1')
    end

    it '#destroy' do
      expect(delete: '/posts/1').to route_to(
                                      controller: 'posts', action: 'destroy', id: '1')
    end
  end
end
