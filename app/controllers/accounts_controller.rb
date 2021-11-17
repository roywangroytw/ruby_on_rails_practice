class AccountsController < ApplicationController

    def sign_up
        @account = Account.new
    end

    def registering

    # puts "======================="
    # puts params
    # puts "======================="

    clean_params = params.require(:account).permit(:first_name, :surname, :password, :email, :password_confirmation) 
    
    @account = Account.new(clean_params)

        if @account.save
            redirect_to "/"
        else
            render :sign_up 
        end
    end

    def login
    end

    def account_checking
    end

end
