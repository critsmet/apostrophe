module Api
  module V1
    class RelationshipsController < ApplicationController

      def create
        @relationship = Relationship.new(follower_id: params["loggedInUser"], followed_id: params["userToFollow"])
        @relationship.save
        render json: @relationship
      end

      def find
        @user = User.find(params["loggedInUser"])
        @relationship = @user.active_relationships.find_by(followed_id: params["userToFollow"])
        render json: @relationship
      end

      def delete
        @user = User.find(params["loggedInUser"])
        @relationship = @user.active_relationships.find_by(followed_id: params["userToUnfollow"])
        @relationship.destroy
      end

      def followers
        @user = User.find(params["user"])
        @followers = @user.followers
        render json: @followers
      end

      def following
        @user = User.find(params["user"])
        @following = @user.following
        render json: @following
      end

    end
  end
end
