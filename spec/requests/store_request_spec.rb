require 'rails_helper'
require 'warden'

include Warden::Test::Helpers

RSpec.describe 'Stores', type: :request do
  let(:user) { User.second }

  before do
    sign_in(user)
  end

  it 'should create store' do
    assert_difference('Store.count') do
      post stores_url, params: { store: { name: 'mavi', user_id: user.id } }
    end
  end

  it 'should destroy store' do
    assert_difference('Store.count', -1) do
      delete store_url(Store.first)
    end
  end

  it 'should update store' do
    @store = Store.first
    patch store_url(Store.first), params: { store: { name: 'adidas' } }

    @store.reload
    expect(@store.name).to eq('adidas')
  end

=begin
// i have webpack problem at my local.
  it 'should not create store with ivalid name' do
    assert_no_difference('Store.count') do
      post stores_url, params: { store: { name: '', user_id: user.id } }
      expect(response.body).to include('Name is invalid')
    end
  end
=end
end
