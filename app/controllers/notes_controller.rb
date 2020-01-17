class NotesController < ApplicationController
    

    def new1
        @note = current_user.notes.build
        
    end

    def new2        
        @note = current_user.notes.build
    end

    def new3
        @note = current_user.notes.build
    end

    def new4
        @note = current_user.notes.build
    end

   

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

    def destroy
    end

    

    private

  
end
