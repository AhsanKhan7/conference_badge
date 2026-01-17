class CheckinsController < ApplicationController
  def show
    @attendee = Attendee.find_by!(token: params[:token])
  end
end
