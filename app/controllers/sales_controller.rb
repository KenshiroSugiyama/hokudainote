class SalesController < ApplicationController
    def index
        @note = Note.where(exhibitor_id: current_user.id)
        
        
    end

    def show
    end
end
