class Notes::ImagesController < ApplicationController
    def new
        note = Note.find(@note_id)
        @images = note.images.build
    end

    def create
        note = Note.find(params[:note_id])
        @images = note.images.build
        if @images.save!
            redirect_to root_path
        else
            render :new
        end
    end

private
    def image_params
        params.require(:image).permit(:image)
    end
end

