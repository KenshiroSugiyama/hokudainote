class Notes::ImagesController < ApplicationController
    def new
        note = Note.find(@note_id)
        @images = note.images.build
    end

    def create 
        note = Note.find(params[:note_id])
        params.permit([:image, :note_id, :sequence])
        begin
            params[:image].each_with_index do |image, idx|
            images = note.images.build(image: image, sequence: idx)
            images.save!
            end
            redirect_to root_path
            flash[:success] ='pdfを保存しました'
        rescue ActiveRecord::RecordInvalid => e
            puts "保存に失敗しました"
            flash.now '保存に失敗しました'
            render :new
        end     
    end

private
   def image_params
    params.permit(:note_id, image: [])
   end
end

