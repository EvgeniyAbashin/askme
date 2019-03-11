require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :username, length: {maximum: 40}, format: {with: /\w/}
  validates :email, format: {with: /[a-zA-Z0-9_.+-]{1,}+@[a-zA-Z0-9-]{1,}+\.[a-zA-Z0-9-.]{1,7}/}



  attr_accessor :password
  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password
  before_validation :normalize_username

  def normalize_username
    self.username = username.downcase
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(
        OpenSSL::Random.random_bytes(16)
      )
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

end
