class Store < ApplicationRecord
  belongs_to :user
  has_many :products, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :name, length: { minimum: 4, maximum: 20 }
  validates_format_of :name, :with => Form.name_pattern
end
