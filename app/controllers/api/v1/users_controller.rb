module Api
  module V1
    class UsersController < ApplicationController

      def set
        if user_params[:email]
          @user = User.new(username: user_params[:username], email: user_params[:email], password: user_params[:password])
          @user.save
          render json: @user
        else
          @user = User.find_by(username: user_params[:username])
          render json: @user
        end
      end

      def show
        @user = User.find_by(username: params[:username])
        render json: @user
      end

      private

      def user_params
        params.require(:inputs).permit(:email, :username, :password)
      end

    end
  end
end
