class Product < ApplicationRecord
  belongs_to :store
  has_many :likes, as: :likeable, dependent: :destroy
  belongs_to :user

  validates :name, length: { minimum: 4, maximum: 20 }, presence: true, uniqueness: true
  validates_format_of :name, :with => Form.name_pattern
  validates :description, length: { minimum: 5, maximum: 250 }
  validates :price, numericality: { greater_than: 0 }
end
