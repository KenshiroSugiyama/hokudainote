class MyPagesController < ApplicationController
    def home
        @card = Card.find_by(user_id: current_user.id)
        @account = BankAccount.find_by(user_id: current_user.id)
    end
end
