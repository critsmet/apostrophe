module Api
	module V1
    class PublicationsController < ApplicationController

      def index
        @publications = Publication.all
        render json: @publications
      end

    end
  end
end
