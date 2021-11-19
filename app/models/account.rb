require 'digest'


class Account < ApplicationRecord


    validates :first_name, presence: true
    
    validates :surname, presence: true

    validates :password, length: { minimum: 6 , message: 'should have at least 6 characters'  }

    validates :password, confirmation: { case_sensitive: true , message: ' not matching'  }

    validates :email, presence: true

    validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
    message: "format is not correct" }

    validates :email, uniqueness: { message: 'already exists' }

    def self.login(login_info)
    
        email = login_info[:email]
        password = login_info[:password]

        salted_password = "123#{password.reverse}xyz"
        encrypted_password = Digest::SHA1.hexdigest(salted_password)

        Account.find_by(email: email, password: encrypted_password)

    end

    before_create :encrypt_password

    private

    def encrypt_password
    
        salted_password = "123#{self.password.reverse}xyz"
        self.password = Digest::SHA1.hexdigest(salted_password)

    end


end
