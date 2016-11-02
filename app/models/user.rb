class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min.cost ? BCypt::Engine::MIN_COST :
                                                      BCypt::Engine.cost
        BCypt::Password.create(string, cost: cost)                                                     
    end
end
