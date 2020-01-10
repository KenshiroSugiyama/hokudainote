class ChangeDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :email, :string, default: "@eis.hokudai.ac.jp"
  end

  def down
    change_column :users, :email, :string, default: ""
  end
end
