class Educator < ApplicationRecord
    def full_name
        self.last_name + self.first_name
    end
    has_one :educator_position
    has_many :educators_departments
    has_many :departments ,through: :educators_departments
    has_many :lectures_educators
    has_many :lectures ,through: :lectures_educators
end
