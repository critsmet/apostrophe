module Api
  module V1
    class LikesController < ApplicationController

      def create
        @like = Like.new(user_id: params["user"], publication_id: params["pub"])
        @like.save
        render json: @like
      end

      def find
        @user = User.find(params["user"])
        @like = @user.likes.find_by(publication: params["pub"])
        render json: @like
      end

      def delete
        @user = User.find(params["user"])
        @like = @user.likes.find_by(publication: params["pub"])
        @like.destroy
      end

    end
  end
end
