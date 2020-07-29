class SessionsController < ApplicationController
    def create
      user=User.find_by(email:params[:email])
      if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to blogs_url
      else
        flash[:errors]=[]
        if params[:email] ==""
          flash[:errors]=flash[:errors].push("Email field is empty")

        end
        if params[:password]==""
         
          flash[:errors]=flash[:errors].push("Password field is empty")

        end


        flash[:errors] =flash[:errors].push("Invalid Combination") 

        redirect_to root_path
      end
    end
def destroy
reset_session
redirect_to root_path
end
end
