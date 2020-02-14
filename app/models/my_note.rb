class MyNote < ApplicationRecord
    belongs_to :buyer, class_name: "User",optional: true
    belongs_to :note
end
