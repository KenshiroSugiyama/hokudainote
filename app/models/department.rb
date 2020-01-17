class Department < ApplicationRecord
    has_many :educator_departments
    has_many :educators ,through: :educator_departments
    belongs_to :faculty
    has_many :notes 
    has_many :user_profiles
end
