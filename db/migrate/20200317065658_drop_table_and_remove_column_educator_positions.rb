class DropTableAndRemoveColumnEducatorPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :educators, :educator_position_id
    drop_table :educator_positions
  end
end
