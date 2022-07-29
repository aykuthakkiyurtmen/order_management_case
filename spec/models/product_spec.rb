require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user) { User.second }
  let(:store) {user.products.first}

  it 'product should be created' do
    product = Product.create(
      name: "tisort", description: "kot pantolon", price: 300, store_id: store.id,user_id: user.id)

    expect(product.valid?).to be(true)
  end

  it 'validates product cannot be created if invalid name' do
    product = Product.create(
      name: "pant123", description: "kot pantolon", price: 300, store_id: store.id,user_id: user.id)

    expect(product.valid?).to be(false)
    expect(product.errors.full_messages).to include('Name is invalid')
  end

  it 'validates product cannot be created if invalid name character' do
    product = Product.create(
      name: "pan", description: "kot pantolon", price: 300, store_id: store.id, user_id: user.id)

    expect(product.valid?).to be(false)
    expect(product.errors.full_messages).to include('Name is too short (minimum is 4 characters)')
  end

  it 'validates product cannot be created if invalid price number' do
    product = Product.create(
      name: "pantolon", description: "kot pantolon", price: 0, store_id: store.id, user_id: user.id)

    expect(product.valid?).to be(false)
    expect(product.errors.full_messages).to include('Price must be greater than 0')
  end

  it 'validates product cannot be created if invalid description' do
    product = Product.create(
      name: "pantolon", description: "kot", price: 300, store_id: store.id,user_id: user.id)

    expect(product.valid?).to be(false)
    expect(product.errors.full_messages).to include('Description is too short (minimum is 5 characters)')
  end

  it 'validates product cannot be created for if name is exist' do
    product = Product.create(
      name: "pantolon", description: "kot pantolon", price: 300, store_id: store.id,user_id: user.id)

    expect(product.valid?).to be(false)
    expect(product.errors.full_messages).to include('Name has already been taken')
  end
end
