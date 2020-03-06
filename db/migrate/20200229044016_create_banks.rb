class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_accounts do |t|
      t.references :user, foreign_key: true
      t.references :bank#, foreign_key: true
      t.string :branch
      t.string :account
      t.string :kind
      t.string :sex
      t.string :name
      t.timestamps
    end
  end
end
