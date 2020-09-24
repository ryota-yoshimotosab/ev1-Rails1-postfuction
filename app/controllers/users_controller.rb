class UsersController < ApplicationController
  
  layout "nosidebar"
  
  def show
    @user = current_user
  end
end
