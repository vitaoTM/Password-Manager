class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # testing adding other models for join tables

  has_many :group_categories
  has_many :groups, through: :group_categories, dependent: :nullify #, ensure_owner_was: current_user

  has_many :user_passwords, dependent: :destroy
  has_many :passwords, through: :user_passwords
end
