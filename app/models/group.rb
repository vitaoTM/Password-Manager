class Group < ApplicationRecord
  has_many :users, through: :memberships, dependent: :nullify
  has_many :memberships
  has_many :user_passwords, through: :users, dependent: :destroy
  has_many :passwords, through: :user_passwords, dependent: :destroy

  validates :name, presence: true
end
