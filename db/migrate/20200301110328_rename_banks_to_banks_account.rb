class RenameBanksToBanksAccount < ActiveRecord::Migration[5.2]
  def change
    rename_table :banks, :bank_accounts
  end
end
