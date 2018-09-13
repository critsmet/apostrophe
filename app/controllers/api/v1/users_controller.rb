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

      def edit
        @user = User.find(user_params[:id])
        @user.update(description: user_params[:description])
        render json: @user
      end

      def photo
        @user = User.find(params["user_id"])
        @image = params["image_file"]
        @response = Cloudinary::Uploader.upload(@image,
          eager: [{ width: 450, height: 450, crop: :crop, gravity: :face }])
        @user.update(image_url: @response["url"])
        render json: @user
      end

      private

      def user_params
        params.require(:inputs).permit(:id, :email, :username, :password, :description, :website_url, :image_url)
      end

    end
  end
end
