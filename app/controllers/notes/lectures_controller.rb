class Notes::LecturesController < ApplicationController
    def new
        @note = current_user.notes.build
    end

    def create  
        @note = current_user.notes.build
        @note.department_id = params[:lectures_path][:department_id]
        @note.lecture_id = params[:lectures_path][:lecture_id]
        @note.description = params[:note][:description]
        @note.price = params[:note][:price]
        @note.grade = params[:note][:grade]
        @note.year = params[:note][:year]

        if @note.save
            @note_id = @note.id
            render template: "notes/images/new", note_id: @note_id
        else
            redirect_to new_lecture_path  
        end
    end

    def get_departments
        render partial: 'get_departments', locals: {faculty_id: params[:faculty]}  
    end

    def get_educators
        render partial: 'get_educators', locals: {department_id: params[:department_id]}
    end

    def get_lectures
        render partial: 'get_lectures', locals: {educator_id: params[:educator]}
    end

private
    def lecture_params
        params.require(:note).permit(:faculty, :department_id, :educator_id,:lecture_id)
    end
end
