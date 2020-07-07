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
        unless current_user.user_profile
            @profile = current_user.build_user_profile
            return render :new
        end
        @department = current_user.user_profile.department
        @faculty = @department.faculty
    end

    def edit 
        @profile = UserProfile.find_by(user_id: current_user.id)
    end

    def update
        @profile = UserProfile.find_by(user_id: current_user.id)
        @profile.name = params[:user_profile][:name]
        @profile.school_year = params[:user_profile][:school_year]
        @profile.department_id = params[:lectures_path][:department_id]
        if @profile.update(profile_params)
            flash[:success] = 'プロフィールを更新しました'
            redirect_to user_profile_path(id: @profile.id)
        else
            flash.now[:danger] = 'プロフィールを更新できません'
            render :edit
        end
    end

    private
    def profile_params
        params.require(:user_profile).permit(:name,:school_year,:lectures_path =>[:department_id])
    end

end
