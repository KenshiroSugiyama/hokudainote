class Note < ApplicationRecord
    belongs_to :user
    belongs_to :lecture
    has_many :images,dependent: :destroy
    belongs_to :department
    has_many :my_notes,dependent: :destroy
    has_many :buyers,through: :my_notes,dependent: :destroy
    belongs_to :exhibitor, class_name: 'User', foreign_key: :exhibitor_id
    
    validates :price ,presence: true 
    validates :year ,presence: true
    validates :grade ,presence: true
    validates :exhibitor_id ,presence: true
    validates :department_id ,presence: true
    validates :lecture_id ,presence: true
    
    def buyed?(user)
        self.buyers.include?(user)
    end
end
