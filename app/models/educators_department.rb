class EducatorsDepartment < ApplicationRecord
    belongs_to :department
    belongs_to :educator
end
