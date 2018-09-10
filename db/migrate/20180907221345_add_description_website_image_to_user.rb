class AddDescriptionWebsiteImageToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :apostrophe_publisher_id
    add_column :users, :description, :string
    add_column :users, :website_url, :string
    add_column :users, :image_url, :string
  end
end
