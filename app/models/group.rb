class Group < ApplicationRecord
  validates :name, presence: true

  has_many :group_categories
  has_many :users, through: :group_categories, dependent: :nullify

  has_many :user_passwords, through: :users, dependent: :destroy
  has_many :passwords, through: :user_passwords, dependent: :destroy
end
