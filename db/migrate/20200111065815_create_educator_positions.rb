class CreateEducatorPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :educator_positions do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
