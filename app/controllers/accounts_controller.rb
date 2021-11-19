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
        @account = Account.new
    end

    def account_checking

        user = Account.login(account_params)

        if user
            session[:abcd] = user.id
            flash[:notice] = "Welcome back #{user.first_name}, good luck with your learning!"
            redirect_to "/"
        else
            flash[:notice] = "Login has failed, please try again"
            redirect_to "/"
            # render html: "User not found!"
        end    
    end

    private

    def account_params

        clean_params = params.require(:account).permit(:first_name, :surname, :password, :email, :password_confirmation) 
        
    end    

end
