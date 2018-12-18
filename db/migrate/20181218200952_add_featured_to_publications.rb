class AddFeaturedToPublications < ActiveRecord::Migration[5.2]
  def change
    add_column :publications, :featured, :boolean
  end
end
