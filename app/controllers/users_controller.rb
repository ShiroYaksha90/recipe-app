class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    set_user
  end

  private

  def set_user
    if params[:id] == 'sign_out'
      sign_out current_user if user_signed_in?
      redirect_to new_user_session_path
    elsif current_user&.id == params[:id].to_i
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
end
