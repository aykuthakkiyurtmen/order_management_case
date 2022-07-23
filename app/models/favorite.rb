class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :product
end
