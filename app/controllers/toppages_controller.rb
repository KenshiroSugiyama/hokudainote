class ToppagesController < ApplicationController
  def index
  end

  def rule
  end

  def form
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new
    @inquiry.name = params[:inquiry][:name]
    @inquiry.email = params[:inquiry][:email]
    @inquiry.message = params[:inquiry][:message]

    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      redirect_to toppages_index_path
      flash[:success] = 'お問い合わせを送信しました！'
      
    else
      render action: "form"
      flash.now[:alert] = 'お問い合わせに失敗しました'
    end
  end

  def profile
  end

  def privacy
  end

  def commerce
  end
end
