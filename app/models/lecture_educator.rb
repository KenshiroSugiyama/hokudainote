class LectureEducator < ApplicationRecord
    belongs_to :lecture
    belongs_to :educator
end
