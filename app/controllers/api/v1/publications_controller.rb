module Api
	module V1
    class PublicationsController < ApplicationController

			def search
				if params["terms"][0] == 'default'
					@publications = Publication.get_default
					render json: {pubs: @publications }
				elsif params["terms"][1] == '' || params["terms"][1] == "all"
					@search = params["terms"][0].downcase
					@publications = Publication.search_tags_and_titles(@search)
					render json: {pubs: @publications }
				elsif params["terms"][0] == ''
					if params["terms"][1] == 'all'
						@publications = Publication.all
						render json: { pubs: @publications }
					else
						@filter = params["terms"][1].split('-').map(&:capitalize).join(' ')
						@publications = Publication.search_filter(@filter)
						render json: { pubs: @publications }
					end
				elsif params["terms"][1] == 'show'
					@title = params["terms"][0].split('-').join(' ')
					@publication = Publication.find_title(@title)
					@similar_pubs = @publication.similar_items(n_results: 4)
					@users = @publication.users
					@fillers = Publication.first(4 - (@similar_pubs - [@publication]).length )
					render json: { pub: @publication, recs: @similar_pubs, fillers: @fillers, users: @users }
				else
					@search = params["terms"][0].downcase
					@filter = params["terms"][1].split('-').map(&:capitalize).join(' ')
					@filtered_pubs = Publication.search_filter(@filter)
					@searched_filtered = @filtered_pubs.search_tags_and_titles(@search)
					render json: { pubs: @searched_filtered }
				end

				def likes
					@publication = Publication.find(params["publication"])
					@likes = @publication.users
					render json: @likes
				end

			end
    end
  end
end
