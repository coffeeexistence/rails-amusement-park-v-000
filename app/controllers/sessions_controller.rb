class SessionsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  def new

  end
  
  def create
    #binding.pry
    set_user
    session[:user_id]=@user.id
    redirect_to user_path(@user), notice: "Welcome back to the theme park!"
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user][:id])
    end

end
