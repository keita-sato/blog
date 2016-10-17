class RemoveImageFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :image, :string
  end
end
