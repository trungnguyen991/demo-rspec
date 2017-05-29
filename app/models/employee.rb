class Employee < ApplicationRecord

  validates :email,      presence:   true
  validates :email,      uniqueness: true

  validates :name,       presence: true, length: {maximum: 50}
  validates :code,       presence: true, length: { is: 6 }
  validates :code,       uniqueness: true
  validates :phone_number, presence: true, length: { maximum: 15 }

end
