class UsersController < ApplicationController
	before_action :authenticate_user!
	


    include ApplicationHelper

    def index
    	@users = User.all
    end

    def show
    	@user = User.find(params[:id])
    end

    def favorites
        @user = User.find(params[:id])
    end

    def follows
        @user = User.find(params[:id])
    end

    def followers
        @user = User.find(params[:id])
    end



    def edit
    end
    def update
    end

end