class ApplicationController < ActionController::Base

def current_user
if session[:user_id]
    return User.find(session[:user_id])
end
end
def require_login
    unless session[:user_id]
flash[:errors]=["You must login first"]
redirect_to users_path       
    end
end

def isLoggedin
    if session[:user_id]
        redirect_to blogs_url
    end
end
end
