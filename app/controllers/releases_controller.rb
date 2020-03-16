class ReleasesController < ApplicationController
    def index
        @sell = Note.where(exhibitor_id: current_user.id)
        @buy = MyNote.where(buyer_id: current_user.id)
    end
end
