class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :delete_all
  has_many :likes, as: :likeable
end
