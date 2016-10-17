class Note < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	acts_as_taggable_on :tags
	acts_as_ordered_taggable_on :interests
	belongs_to :user
	mount_uploader :image, ImageUploader

	validates :title, presence: true
	validates :content, presence: true

	def favorited_by? user
        favorites.where(user_id: user.id).exists?
    end
end

