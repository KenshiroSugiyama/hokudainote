class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true
      t.text :description, :limit => 1000
      t.bigint :price
      t.string :grade , :limit => 3
      t.string :year , :limit => 45 ,index: true
      t.references :exhibitor ,foreign_key: { to_table: :users } 
      t.references :department, foreign_key: true
      t.references :lecture, foreign_key: true
      t.timestamps
    end
  end
end
