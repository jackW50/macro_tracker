class User < ApplicationRecord
  has_many :meals

  validates :username, presence: true
  validates :username, uniqueness: true

end
