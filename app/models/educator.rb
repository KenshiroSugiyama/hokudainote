class Educator < ApplicationRecord
    has_many :lectures
    has_one :educator_position
    has_many :educators_departments
    has_many :departments ,through: :educators_departments
    has_many :lecture_educators
    has_many :lectures ,through: :lecture_educators
end
