class User < ActiveRecord::Base
  
  has_many :articles, dependent: :destroy
  
  before_save { self.email = email.downcase }
  REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25},format: {with: REGEX}
  
  has_secure_password
end