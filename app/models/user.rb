class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_and_belongs_to_many :groups
  belongs_to :group, optional: true

  # has_many :groups, optional: true
  has_many :user_passwords, dependent: :destroy
  has_many :passwords, through: :user_passwords
end
