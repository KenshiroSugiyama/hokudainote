class BankAccount < ApplicationRecord
    belongs_to :user
    belongs_to :bank

    validates :branch ,presence: true
    validates :account ,presence: true
    validates :kind ,presence: true
    validates :sex ,presence: true,format: { with: /\A[A-Z]+\z/}
    validates :name ,presence: true,format: { with: /\A[A-Z]+\z/}

end
