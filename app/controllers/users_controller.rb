# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :authenticate_user

  def index
    @user = User.all
  end
end
