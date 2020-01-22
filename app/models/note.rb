class Note < ApplicationRecord
    belongs_to :user
    belongs_to :lecture
    has_many :note_images
    belongs_to :department
    
    validates :user_id ,presence: true
    validates :price ,presence: true 
    validates :year ,presence: true
    validates :grade ,presence: true
    validates :exhibitor_id ,presence: true
    validates :department_id ,presence: true
    validates :lecture_id ,presence: true
    
end
