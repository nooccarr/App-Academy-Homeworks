module ApplicationHelper

    def auth_token(text)  
        "<input type=\"hidden\"name=\"authenticity_token\"value=\"#{text}\"/>".html_safe
    end

end

