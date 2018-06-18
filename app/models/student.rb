class Student < ApplicationRecord
    attr_accessor :password
    has_secure_password
    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    validates :name, :presence => true, :length => { :in => 3..30 }
    validates :imageUrl, :presence => true
    validates :university, :presence => true, :length => { :in => 3..30 }
    validates :major, :presence => true, :length => { :in => 3..30 }
    validates :area, :presence => true    
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :password, :presence => true
    validates :phone, :numericality => true, :length => { :minimum => 9, :maximum => 15 }

    validates_length_of :password, :in => 6..20, :on => :create

    before_save :encrypt_password
    after_save :clear_password
    
    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
        end
    end

    def clear_password
        self.password = nil
    end

end
