class Notes::LecturesController < ApplicationController
    def new
    end

    def create   
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
end
