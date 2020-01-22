class Educator < ApplicationRecord
    
    has_one :educator_position
    has_many :educators_departments
    has_many :departments ,through: :educators_departments
    has_many :lectures_educators
    has_many :lectures ,through: :lectures_educators
end
