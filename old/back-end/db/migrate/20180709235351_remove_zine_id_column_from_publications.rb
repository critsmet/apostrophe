class RemoveZineIdColumnFromPublications < ActiveRecord::Migration[5.2]
  def change
    remove_column :publications, :zine_id
  end
end
