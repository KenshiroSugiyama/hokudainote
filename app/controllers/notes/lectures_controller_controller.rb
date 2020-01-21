class Notes::LecturesControllerController < ApplicationController
    def new
        @lecture = Lecture.new
    end

    def create
    end

    def get_departments
       if request.xhr?
        render partial: 'get_departments', locals: {faculty_id: params[:faculty]}
       end
    end



end
