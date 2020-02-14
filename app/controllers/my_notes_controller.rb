class MyNotesController < ApplicationController
  def create
    note = Note.find(params[:note_id])
    current_user.buy(note)
    flash[:success] = 'ノートを購入しました。'
    redirect_to root_path
  end

  def destroy
  end

private

end
