class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :likes, as: :likeable
end
