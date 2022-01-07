class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, optional: true
  has_many :items, dependent: :destroy
  before_save :assign_role
  validates :name, presence: true

  def assign_role
    self.role = Role.find_by name: 'Seller' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def seller?
    role.name == 'Seller'
  end

end