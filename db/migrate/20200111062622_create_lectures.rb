class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string :name , index: true
      t.integer :educators_educator_position_id
      t.timestamps
    end
  end
end
