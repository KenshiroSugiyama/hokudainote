class ToppagesController < ApplicationController
  def index
    @notes = User.first.notes.all
  end
end
