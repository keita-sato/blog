class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
        @note = Note.find(params[:note_id])
        @favorite = current_user.favorites.build(note: @note)

        if @favorite.save
          redirect_to notes_url, notice: "お気に入りに登録しました"
        else
          redirect_to notes_url, alert: "この投稿はお気に入りに登録できません"
        end
    end


    def destroy
        @favorite = current_user.favorites.find_by!(note_id: params[:note_id])
        @favorite.destroy
        redirect_to notes_url, notice: "お気に入りを解除しました"
    end

end
