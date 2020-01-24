class NotesController < ApplicationController
    

    
   

    def create
        
    end

    def create1
        @note = Note.new
        #if
         @note.save
            redirect_to new_image_path
        #else
            #render template: "notes/lectures/new"
            #redirect_to new_lecture_path
        #end
    end

    

    private
def lecture_params
    params.require(:notes1_path).permit(:department_id, :lecture_id)
end
  
end
