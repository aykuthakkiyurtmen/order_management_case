require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.second }
  let(:store) {user.products.first}

  it 'Like should be uniq for each user' do
    user = User.second
    product = user.products.first
    like1 = user.likes.new(likeable_id: product.id, likeable_type: 'Product')
    like1.save!
    like2 = user.likes.new(likeable_id: product.id, likeable_type: 'Product')
    expect {like2.save! }.to raise_error
  end

  it 'like should  assign to store' do
    store1 = Like.create({ user_id: user.id, likeable_id: store.id, likeable_type: 'Store'})

    expect(store1.valid?).to be(true)
  end

  it 'likeable_type should be exist' do
    like = Like.new(user_id: user.id, likeable_id: store.id, likeable_type: 'Stores')
    expect {like.save}.to raise_error
  end
end
