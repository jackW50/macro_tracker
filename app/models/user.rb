class User < ApplicationRecord
  has_many :meals

  validates :username, presence: true
  validates :username, uniqueness: true

  has_secure_password

  def self.find_or_create_by_auth(auth)
    self.where(username: auth[:info][:name]).first_or_create do |u|
      u.username = auth[:info][:name]
      u.uid = auth[:uid]
      u.password = SecureRandom.hex 
    end
  end
end
