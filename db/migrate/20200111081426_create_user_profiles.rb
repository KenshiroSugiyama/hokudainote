class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true
      t.references :department, foreign_key: true
      t.integer :school_year
      t.string :name
      t.timestamps
    end
  end
end
