class BankAccountsController < ApplicationController
    def new
        @account = current_user.build_bank_account
    end

    def create
        @account = current_user.build_bank_account
        @account.bank_id = params[:bank_account][:bank_id]
        @account.branch=params[:bank_account][:branch]
        @account.account=params[:bank_account][:account]        
        @account.kind=params[:bank_account][:kind]
        @account.sex=params[:bank_account][:sex]
        @account.name=params[:bank_account][:name]


        if
            #Bank.find(params[:bank_account][:bank_id]).bank_accounts.create
            @account.save!
            
            redirect_to my_pages_home_path
            flash[:success] = '口座を登録しました'
        else
            render action: "new"
            flash.now[:alert] = '口座登録に失敗しました'
        end
    end

    def show
        @account = BankAccount.find_by(user_id: current_user.id)
    end

    def edit
        @account = BankAccount.find_by(user_id: current_user.id) 
    end

    def update
        @account = BankAccount.find_by(user_id: current_user.id) 
        @account.bank_id = params[:bank_account][:bank_id]
        @account.branch=params[:bank_account][:branch]
        @account.account=params[:bank_account][:account]        
        @account.kind=params[:bank_account][:kind]
        @account.sex=params[:bank_account][:sex]
        @account.name=params[:bank_account][:name]

        if
            #Bank.find(params[:bank_account][:bank_id]).bank_accounts.create
            @account.update(account_params)
            
            redirect_to my_pages_home_path
            flash[:success] = '口座を更新しました'
        else
            render action: "edit"
            flash.now[:alert] = '更新に失敗しました'
        end
    end

    private
    def account_params
        params.require(:bank_account).permit(:bank_id,:branch,:account,:kind,:sex,:name)
    end
end

