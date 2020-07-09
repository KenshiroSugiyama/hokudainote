class MyNote < ApplicationRecord
    belongs_to :buyer, class_name: "User",optional: true, foreign_key: 'buyer_id'
    belongs_to :note
end
