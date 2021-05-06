class UsersController < ApplicationController

    before_action :set_user, only: [:show]

    def index
        @users = User.all
        render json: @users
    end

    def show
        user_json = UserSerializer.new(@user).serialized_json

        render json: user_json
    end

    # def create
    #     user = User.new(user_params)

    #     if user.save
    #         session[:user_id] = user.id

    #         render jsonS
    # end

    private

    def set_user
        @user = User.find(params[:id])
    end

end