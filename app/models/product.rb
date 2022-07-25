class Product < ApplicationRecord
  belongs_to :store
  has_many :likes, as: :likeable
end
