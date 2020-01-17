class CreateEducators < ActiveRecord::Migration[5.2]
  def change
    create_table :educators do |t|
      t.string :first_name
      t.string :last_name ,index: true
      t.references :educator_position ,foreign_key: true
      t.timestamps
    end
  end
end
