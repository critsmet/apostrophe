module Api
	module V1
    class PublicationsController < ApplicationController

			def search
				if params["terms"][1] == '' || params["terms"][1] == "all"
					@search = params["terms"][0].downcase
					@publications = Publication.where("lower(tags) like ?", "%#{@search}%").or( Publication.where("lower(title) like ?", "%#{@search}%") )
					render json: @publications
				elsif params["terms"][0] == ''
					if params["terms"][1] == 'all'
						@publications = Publication.all
						render json: @publications
					else
						@filter = params["terms"][1].split('-').map(&:capitalize).join(' ')
						@publications = Publication.where("genres like ?", "%#{@filter}%")
						render json: @publications
					end
				else
					@search = params["terms"][0].downcase
					@filter = params["terms"][1].split('-').map(&:capitalize).join(' ')
					@filtered_pubs = @publications = Publication.where("genres like ?", "%#{@filter}%")
					@searched_filtered = @filtered_pubs.where("lower(tags) like ?", "%#{@search}%").or( Publication.where("lower(title) like ?", "%#{@search}%") )
					render json: @searched_filtered
				end
			end
    end
  end
end
