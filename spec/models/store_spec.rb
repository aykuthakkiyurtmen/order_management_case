require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:user) { User.second }

  it 'store should be created' do
    store = Store.create({name: "bershka", user_id: user.id})

    expect(store.valid?).to be(true)
  end

  it 'validates store cannot be created if invalid name character' do
    store = Store.create({name: "nik", user_id: user.id})

    expect(store.valid?).to be(false)
    expect(store.errors.full_messages).to include('Name is too short (minimum is 4 characters)')
  end

  it 'validates store cannot be created if invalid name' do
    store = Store.create({name: "nike123", user_id: user.id})

    expect(store.valid?).to be(false)
    expect(store.errors.full_messages).to include('Name is invalid')
  end

  it 'validates store cannot be created for if name is exist' do
    store = Store.create({name: "nike", user_id: user.id})

    expect(store.valid?).to be(false)
    expect(store.errors.full_messages).to include('Name has already been taken')
  end
end
