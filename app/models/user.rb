class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: true
  has_many :likes
  has_many :stores, dependent: :destroy
  has_many :products, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 40 }, presence: true
  validates_format_of :name, :with => Form.name_pattern
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Regular' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def regular?
    role.name == 'Regular'
  end
end
