class BlogsController < ApplicationController
before_action :require_login, :except => [:index]

    def index

    if session[:user_id]
    @user = User.find(session[:user_id])
    end
    if params[:filter_genre]
    @blogs =Blogg.where(blog_genre:params[:filter_genre])  
    else 
        @blogs=Blogg.order('created_at DESC')

    end

    @genres=["Fashion","Travel","Music","Lifestyle","Fitness","Sports","Parenting","Food","DIY"]
   
    end

    def new 
    @user=User.find(session[:user_id])
    @blog=Blogg.new 
    @genres=["Fashion","Travel","Music","Lifestyle","Fitness","Sports","Parenting","Food","DIY"]
    end


    def create
    blog=Blogg.new(blog_params)
    if blog.save 
    redirect_to root_path
    else
        flash[:errors]=blog.errors.full_messages
        redirect_back(fallback_location: root_path)
    end
    end

private
    def blog_params
        params.require(:blog).permit(:blog_name,:blog,:blog_genre,:user_id)
    end

    def filter_params
        params.permit(:filter_genre)
    end
end
