class ChangeImagesToNoteImages < ActiveRecord::Migration[5.2]
  def change
    rename_table :note_images, :images
  end
end
