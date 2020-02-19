class UserProfile < ApplicationRecord
    belongs_to :department
    belongs_to :user

    validates :name,presence: true 
    validates :department_id ,presence: true 
    validates :school_year ,presence: true 

end