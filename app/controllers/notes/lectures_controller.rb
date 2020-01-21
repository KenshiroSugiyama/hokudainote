class Notes::LecturesController < ApplicationController
    def new
        @lecture = Lecture.new
    end

    def create
    end

    def get_departments
        render partial: 'get_departments', locals: {faculty_id: params[:faculty]}  
    end

    def get_educators
        
        render partial: 'get_educators', locals: {department_id: params[:department]}
    end


end
