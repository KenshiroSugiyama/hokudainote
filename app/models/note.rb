class Note < ApplicationRecord
    belongs_to :user
    belongs_to :lecture
    has_many :images
    belongs_to :department
    has_many :my_notes
    has_many :buyers,through: :my_notes
    
    validates :price ,presence: true 
    validates :year ,presence: true
    validates :grade ,presence: true
    #validates :exhibitor_id ,presence: true
    validates :department_id ,presence: true
    validates :lecture_id ,presence: true
    
end
