class RenameListDepartmentEducatorsToDeaprtmentsEducators < ActiveRecord::Migration[5.2]
  def change
    rename_table :educator_departments, :educators_departments
  end
end
