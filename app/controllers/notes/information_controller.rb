class Notes::InformationController < ApplicationController
    def new
        @information = Note.new
    end
    
    def create
        @information = Note.new
    end
end
