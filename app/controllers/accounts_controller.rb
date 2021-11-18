class AccountsController < ApplicationController

    def sign_up
        @account = Account.new
    end

    def registering
    
    @account = Account.new(account_params)

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

    private

    def account_params

        clean_params = params.require(:account).permit(:first_name, :surname, :password, :email, :password_confirmation) 
        
    end    

end
