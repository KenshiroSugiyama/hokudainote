class NotesController < ApplicationController
    

    
   

    def create
        @note = current_user.notes.build
        if @note.save
            flash[:success] = 'ノートを出品しました！'
            redirect_to root_url
        else
        @notes = current_user.notes.order(id: :desc).page(params[:page])
            flash.now[:danger] = 'ノートを出品できません'
            render 'toppages/index'
        end
    end

    def create1
        if save(lecture_params)
            redirect_to new_image_path
        else
            render :new
        end
    end

    

    private
def lecture_params
    params.require(:notes1_path).permit(:department_id, :lecture_id)
end
  
end
