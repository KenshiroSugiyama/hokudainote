class MyNotesController < ApplicationController
  require "payjp"
  def create
    if current_user.cards.blank?
      redirect_to new_card_path
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @note = Note.find(params[:note_id])
      current_user.buy(@note)


      card = current_user.cards.first
      Payjp.api_key = "sk_test_c488b942b82d9928d5c39a74"
      charge = Payjp::Charge.create(
      amount: @note.price,
      customer: card.customer_id,
      currency: 'jpy',
      )
      flash[:success] = '購入しました'
      redirect_to root_path
    end 
  end

  def destroy
  end

private

end
