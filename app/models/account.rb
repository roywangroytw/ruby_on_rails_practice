require 'digest'


class Account < ApplicationRecord


    validates :first_name, presence: true
    
    validates :surname, presence: true

    validates :password, length: { minimum: 6 , message: 'should have at least 6 characters'  }

    validates :password, confirmation: { case_sensitive: true , message: ' not matching'  }

    validates :email, presence: true

    validates :email, uniqueness: { message: 'already exists' }

    validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
    message: "format is not correct" }

    before_create :encrypt_password

    private

    def encrypt_password
    
        salted_password = "123#{self.password.reverse}xyz"
        self.password = Digest::SHA1.hexdigest(salted_password)

    end


end
