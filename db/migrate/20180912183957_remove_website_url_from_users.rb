class RemoveWebsiteUrlFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :website_url
  end
end
