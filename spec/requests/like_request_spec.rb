require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  let(:user) { User.second }
  let(:store) {user.products.first}

  before do
    sign_in(user)
  end

  it 'should create Like for store' do
    assert_difference('Like.count') do
      post likes_url, params: { like: { likeable_id: store.id, likeable_type: 'Store', } }
    end
  end

  it 'should create Like for product' do
    assert_difference('Like.count') do
      post likes_url, params: { like: { likeable_id: store.id, likeable_type: 'Product', } }
    end
  end

  it 'should not assign like for invalid store' do
    expect do
      post likes_url, params: { like: { likeable_id: store.id, likeable_type: 'Storess', } }
      expect(response.body).to include('wrong constant name')
    end.to raise_exception
  end
end
