module Api
	module V1
    class PublicationsController < ApplicationController

			def search
				if params["terms"][0] == 'default'
					@publications = Publication.find( [2, 1, 8, 10, 3, 9, 6, 7, 13, 4, 5, 12])
					render json: {pubs: @publications }
				elsif params["terms"][1] == '' || params["terms"][1] == "all"
					@search = params["terms"][0].downcase
					@publications = Publication.where("lower(tags) like ?", "%#{@search}%").or(Publication.where("lower(title) like ?", "%#{@search}%")).order(:title)
					render json: {pubs: @publications }
				elsif params["terms"][0] == ''
					if params["terms"][1] == 'all'
						@publications = Publication.all
						render json: { pubs: @publications }
					else
						@filter = params["terms"][1].split('-').map(&:capitalize).join(' ')
						@publications = Publication.where("genres like ?", "%#{@filter}%").order(:title)
						render json: { pubs: @publications }
					end
				elsif params["terms"][1] == 'show'
					@title = params["terms"][0].split('-').join(' ')
					@publication = Publication.where("lower(title) = ?", "#{@title}").first
					@similar_pubs = @publication.similar_items(n_results: 4)
					@users = @publication.users
					@fillers = Publication.first(4 - (@similar_pubs - [@publication]).length )
					render json: { pub: @publication, recs: @similar_pubs, fillers: @fillers, users: @users }
				else
					@search = params["terms"][0].downcase
					@filter = params["terms"][1].split('-').map(&:capitalize).join(' ')
					@filtered_pubs = @publications = Publication.where("genres like ?", "%#{@filter}%")
					@searched_filtered = @filtered_pubs.where("lower(tags) like ?", "%#{@search}%").or(Publication.where("lower(title) like ?", "%#{@search}%")).order(:title)
					render json: { pubs: @searched_filtered }
				end

			end
    end
  end
end
