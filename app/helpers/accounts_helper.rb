module AccountsHelper

    def inline_errors(model, model_attribute)
        result = ""
        if model_attribute == :first_name
            type = "First name"
        elsif model_attribute == :surname
            type = "Surname"
        elsif  model_attribute == :email
            type = "Email"
        elsif model_attribute == :password
            type = "Password"
        elsif model_attribute == :password_confirmation
            type = "Password" 
        end
                       
        if model.errors[model_attribute].any?
             model.errors[model_attribute].each do |message|
                result += "<li>#{type} #{message}<li>"
            end
        end
        return "<ul>#{result}</ul>".html_safe
      end

end
