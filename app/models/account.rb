class Account < ApplicationRecord


    # how to put customized error messages?
    validates :first_name, presence: true
    
    # how to put customized error messages?
    validates :surname, presence: true

    # how to put customized error messages?
    validates :password, length: { minimum: 6 , message: 'should have at least 6 characters'  }

    validates :password, confirmation: { case_sensitive: true , message: ' not matching'  }

    validates :email, presence: true

    validates :email, uniqueness: { message: 'already exists' }

    validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
    message: "format is not correct" }


end
