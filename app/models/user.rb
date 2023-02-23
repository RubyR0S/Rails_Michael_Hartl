class User < ApplicationRecord
  attr_accessor :remember_token
  # before_save { self.email = email.downcase }
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, 
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false } 
  validates :password, length: { minimum: 6 }
  has_secure_password


  # Возвращает дайджест для указанной строки. 
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? 
    BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost 
    BCrypt::Password.create(string, cost: cost)
  end

  # Возвращает случайный токен. 
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Запоминает пользователя в базе данных для использования в постоянных сеансах. 
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Возвращает true, если указанный токен соответствует дайджесту. 
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token) 
  end

  # Забывает пользователя 
  def forget
    update_attribute(:remember_digest, nil) 
  end
end
