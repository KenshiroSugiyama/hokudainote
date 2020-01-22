class Notes::ImagesController < ApplicationController
    def new
        @images = Image.new
    end

    def create
        @images = Image.new
        if @images.save
            redirect_to new_information_path
        else
            render :new
        end
    end
end

