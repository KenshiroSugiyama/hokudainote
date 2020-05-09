class RemoveEducatorsEducatorPositionFromLectures < ActiveRecord::Migration[5.2]
  def change
    remove_column :lectures, :educators_educator_position_id
  end
end
