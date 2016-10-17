class Favorite < ActiveRecord::Base
	belongs_to :user
    belongs_to :note
    validates :user, presence: true
    validates :user_id, uniqueness: { scope: :note_id }
    validates :note, presence: true
end
