class NotesController < ApplicationController
    def confirm
    end
    
    def index
        @notes = Note.all
    end

    def show
        @image = Image.where(note_id: params[:id])
        @note = Note.find(params[:id])
        @lecture = Lecture.find(@note.lecture_id)
        @exhibitor = UserProfile.find_by(user_id: @note.exhibitor_id)
        #@user = User.find(@note.exhibitor_id).name
        @i = Image.where(note_id: @note.id).where(sequence: 0)
    end

    
    

    private

  
end
