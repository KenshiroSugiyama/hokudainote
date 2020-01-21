class CreateEducatorDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :educators_departments do |t|
      t.references :educator, foreign_key: true
      t.references :department, foreign_key: true
      t.timestamps
    end
  end
end
