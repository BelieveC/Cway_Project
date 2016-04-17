class UsersController < ApplicationController
	before_action :get_user, only:[:show,:update,:edit,:destroy]

	def index
		@users = User.all.order("created_at DESC");
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy
	end

	private
		def get_user
			@user = User.find(params[:id])
			end

		def user_params
			params.require(:user).permit(:handle)
		end
end
