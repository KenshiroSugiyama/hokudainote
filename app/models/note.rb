class Note < ApplicationRecord
    belongs_to :user
    belongs_to :lecture
    has_many :note_images
    belongs_to :department
    #accepts_nested_attributes_for :lectures
    #accepts_nested_attributes_for :departments
end
