class UserProfilesController < ApplicationController
    def new
        @profile = current_user.build_user_profile
    end

    def create
        @profile = current_user.build_user_profile
        @profile.name = params[:user_profile][:name]
        @profile.school_year = params[:user_profile][:school_year]
        @profile.department_id = params[:lectures_path][:department_id]
        if
            @profile.save!
            redirect_to root_path
            flash[:notice] = '登録しました'
        else
            redirect_to action: "new"
            flash[:alert] = '登録に失敗しました'
        end
    end

    def get_departments
        render partial: 'get_departments', locals: {faculty_id: params[:faculty]}  
    end

    def show
        @department = Department.find(current_user.user_profile.department_id)
        @faculty = Faculty.find(@department.faculty_id).name
        
    end

    def edit 
    end

    def update
    end

end
