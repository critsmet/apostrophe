class RemoveEmailFromPublications < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :email
  end
end
