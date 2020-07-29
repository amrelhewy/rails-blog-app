class UsersController < ApplicationController
    before_action :isLoggedin, only: [:index]

def index
@user=User.new
end

def create
user=User.new(user_params)
if user.save
    redirect_to users_path
else
    flash[:errors]= user.errors.full_messages
    redirect_to action: "new"
end
end
def new

end

private
def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation);   
end

end
