class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.references :faculty ,foreign_key: true
      t.string :name ,index: true
      t.timestamps
    end
  end
end
