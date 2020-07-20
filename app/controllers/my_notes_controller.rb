class MyNotesController < ApplicationController
  require "payjp"
  def create
    @note = Note.find(params[:note_id])
    if user_signed_in?
      if current_user.cards.blank?
        redirect_to new_card_path
        flash[:alert] = '購入にはクレジットカード登録が必要です'
      else
        current_user.buy(@note)
        card = current_user.cards.first
        Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
        charge = Payjp::Charge.create(
        amount: @note.price,
        customer: card.customer_id,
        currency: 'jpy',
        )
        flash[:success] = '購入しました'
        redirect_to note_path(@note.id)
      end 
    else
      redirect_to note_path(@note.id)
      flash[:alert] = '購入にはログインが必要です'
    end
  end

  def destroy
  end

private

end
