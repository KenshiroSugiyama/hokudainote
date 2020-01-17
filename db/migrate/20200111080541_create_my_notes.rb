class CreateMyNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :my_notes do |t|
      t.references :buyer ,foreign_key: { to_table: :users } 
      t.references :note ,foreign_key: true
      t.timestamps
    end
  end
end
