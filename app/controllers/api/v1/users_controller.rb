module Api
  module V1
    class UsersController < ApplicationController

      def set
        if params["inputs"]["email"]
          @user = User.new(username: params["inputs"]["username"], email: params["inputs"]["email"], password: params["inputs"]["password"])
          @user.save
          render json: @user
        else
          @user = User.find_by(username: params["inputs"]["username"])
          render json: @user
        end
      end

    end
  end
end
