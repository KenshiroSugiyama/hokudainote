class RenamelidtUsersToEditability < ActiveRecord::Migration[5.2]
  def change
    rename_table :lecture_educators, :lectures_educators
  end
end
