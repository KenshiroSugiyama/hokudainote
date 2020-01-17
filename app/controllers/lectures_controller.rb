class LecturesController < ApplicationController
    def index
        @lecture = Lecture.all
    end

    def import
        Lecture.import(params[:file])
        redirect_to lectures_url
    end
end