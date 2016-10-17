class RelationshipsController < ApplicationController
	 before_action :authenticate_user!

    def create
        @user = User.find(params[:user_id])
        follow = current_user.relationships.build(following_id: @user.id)
        if follow.save
            redirect_to notes_url, notice: "フォローしました"
        else
            redirect_to notes_url, alert: "フォローできません"
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        follow = current_user.relationships.find_by!(following_id: @user.id)
        follow.destroy
        redirect_to notes_url, notice: "フォロー解除しました"
    end
end
