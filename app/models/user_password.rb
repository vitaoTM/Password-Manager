class UserPassword < ApplicationRecord
  ROLES = %w{viewer editor owner}
  belongs_to :user
  belongs_to :password

  validates :role, presence: true, inclusion: { in: ROLES }
end
