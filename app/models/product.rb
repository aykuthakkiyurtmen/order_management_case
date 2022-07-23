class Product < ApplicationRecord
  belongs_to :store
  has_many :favorites
end
