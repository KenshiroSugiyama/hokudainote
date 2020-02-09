class AddEducatorIdToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :educator_id, :integer
  end
end
