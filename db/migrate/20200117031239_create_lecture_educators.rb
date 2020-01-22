class CreateLecturesEducators < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures_educators do |t|
      t.references :educator, foreign_key: true
      t.references :lecture, foreign_key: true
      t.timestamps
      t.index [:educator_id, :lecture_id], unique: true
    end
  end
end
