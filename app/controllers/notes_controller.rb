class NotesController < ApplicationController
    def confirm
    end
    
    def index
        @notes = Note.all
    end

    def show
        @image = Image.find_by(note_id: params[:id])
        @note = Note.find(params[:id])
        @lecture = Lecture.find(@note.lecture_id)
        #@user = User.find(@note.exhibitor_id).name
    end

    
    

    private

  
end
