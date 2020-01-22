class Image < ApplicationRecord
    belongs_to :note
    mount_uploader :image, ImageUploader
    validates :image , presence: true
    validates :note_id , presence: true
    
end
