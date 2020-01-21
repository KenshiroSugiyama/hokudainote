class Department < ApplicationRecord
    has_many :educators_departments
    has_many :educators ,through: :educators_departments
    belongs_to :faculty
    has_many :notes 
    has_many :user_profiles
end
