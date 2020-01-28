class Notes::InformationController < ApplicationController
    def new
        @note = Note.new
    end
    
    def create
        
        if params[:description]and[:price]and[:grade]and[:year].presence?
            render :new
        else
            redirect_to confirmation_path
        end
    end

    private
    def information_params
        params.require(:note).permit(:description, :price, :grade, :year)
    end

end
