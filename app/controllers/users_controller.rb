class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
		@roles = @user.roles.all

		render 'show.html.erb'
	end

	def new
		@user = User.new
	end

	def create
    user = User.create(user_params)
    redirect_to user_path(user)
  end

private
  def user_params
    params.require(:user).permit(:name, :password, role_ids: [], :active)
  end
end
