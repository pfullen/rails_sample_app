class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    attr_accessor :remember_token, :activation_token, :reset_token
    before_save :downcase_email
    before_create :create_activation_digest
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    def self.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
        #cost = ActiveModel::SecurePassword.min.cost ? BCypt::Engine::MIN_COST :
         #                                             BCypt::Engine.cost
        #BCypt::Password.create(string, cost: cost)    
    end
    
    #Returns a random token
    def self.new_token
        SecureRandom.urlsafe_base64
    end
    
    #Remembers a user in the database for use in persistent sessions
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches in the digest
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    def forget
        update_attribute(:remember_digest, nil)
    end
    
    # Activates an account.
     def activate
       update_columns(activated: FILL_IN, activated_at: FILL_IN)
     end
    
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end
    
    # sets the password reset attribute
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end
    
    # Sends password reset email
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end
    
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end
    
    # Defines a proto-feed
    # See "Following Users for the full implementation"
    def feed
       Micropost.where("user_id = ?", id) 
    end
    
        
    private
    
    #converts email to all lower_case
    def downcase_email
        self.email = email.downcase
    end
    
    #Creates and assigns the activation token and digest
    
    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end
end
